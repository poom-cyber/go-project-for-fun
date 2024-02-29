pipeline {
    agent any

    stages {
        stage('Build') {
            steps {
                echo 'Building the Go application'
                sh 'docker run --rm -v /var/jenkins_home/workspace/poc3:/go/src/app -w /go/src/app golang:1.17 go build -o goservice main.go'
            }
        }

        stage('Unit Testing') {
            steps {
                echo 'Running unit tests'
                sh 'docker run --rm -v /var/jenkins_home/workspace/poc3:/go/src/app -w /go/src/app golang:1.17 go test'
            }
        }

        stage('Deploy/Run') {
            steps {
                echo 'Starting the Go application'
                sh 'docker run --rm -d -v /var/jenkins_home/workspace/poc3:/go/src/app -w /go/src/app -p 8080:8080 golang:1.17 go run main.go'
            }
        }
    }
}
