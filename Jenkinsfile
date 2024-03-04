pipeline {
    agent any
    
    stages {
        stage('Build') {
            steps {
                // Checkout source code from Git repository
                git 'https://github.com/poom-cyber/go-project-for-fun.git'
                
                // Build Golang application
                sh 'go build -o main .'
            }
        }
        stage('Deploy') {
            steps {
                // Copy built binary to Golang container
                script {
                    docker.image('my-golang-app').inside {
                        sh 'docker cp main golang_container:/app/main'
                    }
                }
                
                // Restart Golang container to apply changes
                sh 'docker restart golang_container'
            }
        }
    }
}
