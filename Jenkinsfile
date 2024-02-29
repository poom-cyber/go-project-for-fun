pipeline {
    agent any

    tools {
        go '1.22.0'
    }

    stages {
        stage('Build') {
            steps {
                echo 'Building the Go application'
                sh 'go build -o goservice main.go'
            }
        }

        stage('Unit Testing') {
            steps {
                echo 'Running unit tests'
                sh 'go test'
            }
        }

        stage('Deploy/Run') {
            steps {
                echo 'Starting the Go application from host side'
                sh 'go run .'
            }
        }
    }
}
