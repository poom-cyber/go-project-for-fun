pipeline {
    agent any

    tools {
        go 'go1.21.4'
    }

    stages {
        stage('Check Environment') {
            steps {
                script {
                    if (isRunningInsideDocker()) {
                        echo 'Running inside a Docker container'
                        // Perform actions specific to Docker environment
                    } else {
                        echo 'Not running inside a Docker container'
                        // Perform actions specific to non-Docker environment
                    }
                }
            }
        }
        stage('Build') {
            steps {
                sh 'pwd'
                sh 'ls -l'
                echo 'Building the Go application'
                sh 'go build -o goservice main.go'
            }
        }

        stage('Unit Testing') {
            steps {
                sh 'pwd'
                echo 'Running unit tests'
                sh 'ls -l'
                sh 'go test'
            }
        }

        stage('Deploy/Run') {
            steps {
                script {
                    def port = 8070

                    // Check if the port is already in use
                    def portInUse = sh(script: "sudo netstat -tuln | grep ${port}", returnStdout: true).trim().isEmpty()


                    if (portInUse) {
                        // Get the PID of the process using the port
                        def netstatOutput = sh(script: "sudo netstat -tulnp | grep ${port}", returnStdout: true).trim()
                        def pid = (netstatOutput =~ /(\d+)\/java/)[0][1] // Extract PID from netstat output

                        // Print the PID and process details
                        echo "Process using port ${port}: PID=${pid}"

                        // Terminate the process
                        sh "sudo kill ${pid}"
                        echo "Process with PID ${pid} terminated."
                    }

                    // Start the Go application using the selected port
                    echo "Starting the Go application on port ${port}"
                    sh "nohup go run main.go -port=${port} > output.log 2>&1 &"
                }
            }
        }
    }
}

def isRunningInsideDocker() {
    // Check if the HOSTNAME environment variable is set
    return env.HOSTNAME != null
}
