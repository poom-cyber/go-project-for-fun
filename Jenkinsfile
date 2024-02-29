pipeline {
    agent any

    stages {
        stage('Build Docker Image') {
            steps {
                script {
                    // Build Docker image
                    sh 'docker build -t my-go-app .'
                }
            }
        }

        stage('Run Docker Container') {
            steps {
                script {
                    // Run Docker container
                    sh 'docker run -d -p 8070:8070 --name my-go-container my-go-app'
                }
            }
        }

        stage('Verify Deployment') {
            steps {
                script {
                    // Perform a test by sending a request to the container
                    sh 'curl http://localhost:8070/albums'
                }
            }
        }
    }

    post {
        always {
            script {
                // Stop and remove the Docker container
                sh 'docker stop my-go-container'
                sh 'docker rm my-go-container'
                
                // Remove the Docker image
                sh 'docker rmi my-go-app'
            }
        }
    }
}
