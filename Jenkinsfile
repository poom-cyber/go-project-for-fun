pipeline {
    agent any

    stages {
        stage('Build Docker Image') {
            steps {
                script {
                    docker.build('my-go-app', '-f Dockerfile .')
                }
            }
        }

        stage('Run Docker Container') {
            steps {
                script {
                    docker.image('my-go-app').run('-p 8090:8090 -d my-go-app')
                }
            }
        }

        stage('Verify Deployment') {
            steps {
                script {
                    sh 'curl http://localhost:8090/albums'
                }
            }
        }
    }

    post {
        always {
            script {
                docker.image('my-go-app').stop()
                docker.image('my-go-app').remove()
            }
        }
    }
}
