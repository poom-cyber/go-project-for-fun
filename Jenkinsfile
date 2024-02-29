pipeline {
    agent any
    tools {
        go '1.22.0'
    }
    stages {
        stage('build') {
            steps {
                echo 'build app'
                sh 'go version'
                sh 'go build main.go'
            }
        }
        stage('Unit Testing') {
            steps {
                echo 'Unit testing '
                sh 'go test'
            }
        }
        stage('Deploy/Run') {
            steps {
                sh 'nohup go run main.go 2>&1 &'
            }
        }
    }
}