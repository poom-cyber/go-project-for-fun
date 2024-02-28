pipeline {
    agent any
    tools {
        go '1.17.0' // Update to a specific Go version
    }
    stages {
        stage('Build') {
            steps {
                echo 'Building the Go application'
                dir('main.go') {
                    sh 'go build main.go'
                }
            }
        }
        stage('Unit Testing') {
            steps {
                echo 'Running unit tests'
                dir('main_test.go') {
                    sh 'go test'
                }
            }
        }
        stage('Deploy/Run') {
            steps {
                echo 'Deploying and running the Go application'
                dir('main.go') {
                    sh 'nohup ./main 2>&1 &'
                }
            }
        }
    }
}
