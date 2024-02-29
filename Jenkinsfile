pipeline {
    agent any

    tools {
        go '1.22.0'
    }

    stages {
        stage('Build') {
            steps {
                echo 'Building the Go application'
                sh 'mkdir -p bin'
                sh 'go build -o bin/goservice main.go'
            }
        }

        stage('Unit Testing') {
            steps {
                echo 'Running unit tests'
                sh 'go test ./...'
            }
        }

        stage('Deploy/Run') {
            steps {
                echo 'Building Docker image for Go application'
                sh 'docker build -t my-go-app .'

                echo 'Starting the Go application container'
                sh 'docker run -d -p 8070:8070 --name go-app-container my-go-app'
            }
        }

        stage('Cleanup') {
            steps {
                echo 'Cleaning up'
                sh 'docker stop go-app-container || true'
                sh 'docker rm go-app-container || true'
            }
        }
    }
}
