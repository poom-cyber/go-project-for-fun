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
                    def port = 8070 // Specify the port your Go application should use

                    // Check if the port is already in use
                    def portInUse = sh(script: "netstat -tuln | grep ${port}", returnStatus: true).status == 0

                    if (portInUse) {
                        echo "Port ${port} is already in use. Terminating processes using the port..."
                        // Terminate processes using the port
                        sh "fuser -k ${port}/tcp"
                        echo "Processes using port ${port} terminated."
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