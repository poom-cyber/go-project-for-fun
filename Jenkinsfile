pipeline {
    agent any

    stages {
        stage('Build Docker Image') {
            steps {
                script {
                    // Build Docker image for the Go application
                    docker.build('my-go-app', '-f Dockerfile .')
                }
            }
        }

        stage('Run Docker Container') {
            steps {
                script {
                    // Run Docker container from the built image
                    docker.image('my-go-app').run('--name my-go-container -d')
                }
            }
        }
    }

    post {
        always {
            // Cleanup: Stop and remove the Docker container after pipeline execution
            cleanWs()
            sh 'docker stop my-go-container'
            sh 'docker rm my-go-container'
        }
    }
}
