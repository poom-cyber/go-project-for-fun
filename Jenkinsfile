pipeline {
    agent any

    stages {
        stage('Build') {
            steps {
                echo 'Building the Go application'
                sh 'go build -o goservice main.go'
            }
        }

        stage('Deploy/Run') {
            steps {
                echo 'Starting the Go application'
                sh './goservice &'
            }
        }
    }
}
