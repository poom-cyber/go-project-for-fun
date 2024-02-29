pipeline {
    agent any

    tools {
        go '1.22.0'
    }

    stages {
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
                sh 'nohup go run main.go > output.log 2>&1 &'
            }
        }
    }
}
