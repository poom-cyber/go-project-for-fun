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
                echo 'Starting the Go application'
                //sh './main &'
                sh 'nohup go run main.go 2>&1 &'
            }
        }
    }
}
