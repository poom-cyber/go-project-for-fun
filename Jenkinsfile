pipeline {
    agent any

    tools {
        go '1.22.0'
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
                sh 'pwd'
                sh 'ls -l'
                echo 'Starting the Go application from host side'

                // Create systemd service file
                writeFile file: '/etc/systemd/system/goapp.service', text: '''
[Unit]
Description=Go Application
After=network.target

[Service]
Type=simple
ExecStart=/var/jenkins_home/workspace/poc3/goservice
WorkingDirectory=/var/jenkins_home/workspace/poc3
Restart=always

[Install]
WantedBy=multi-user.target
'''

                // Reload systemd
                sh 'sudo systemctl daemon-reload'

                // Start and enable the service
                sh 'sudo systemctl start goapp'
                sh 'sudo systemctl enable goapp'

                // Check service status
                sh 'sudo systemctl status goapp'
            }
        }
    }
}

def isRunningInsideDocker() {
    // Check if the HOSTNAME environment variable is set
    return env.HOSTNAME != null
}