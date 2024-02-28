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
        // stage('Deploy/Run') {
        //     steps {
        //         sh 'nohup go run main.go 2>&1 &'
        //         sh 'sleep 10' // Wait for 10 seconds
        //     }
        // }
        stage('Deploy/Run') {
    steps {
        sh 'go build -o myapp main.go' // Build the application
        sh './myapp &' // Run the compiled binary in the background
        sh 'sleep 10' // Wait for 10 seconds
    }
}

    }
}