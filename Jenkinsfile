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
                sh 'go version'
                sh 'go test'
            }
        }
    }
}