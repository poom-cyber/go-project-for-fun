pipeline {
    agent any
    
    tools {
        go '1.22.0'
    }
    
    environment {
        GO114MODULE = 'on'
        CGO_ENABLED = 0 
        GOPATH = "${JENKINS_HOME}/jobs/${JOB_NAME}/builds/${BUILD_ID}"
    }
    
    stages {
        stage("Unit Test") {
            steps {
                echo 'Running Unit Tests'
                sh 'go test'
            }
        }
        
        stage("Build") {
            steps {
                echo 'Building Go Application'
                sh 'go build -o main'
            }
        }
        
        stage('Deliver') {
            agent any
            steps {
                script {
                    withCredentials([usernamePassword(credentialsId: 'dockerhub', passwordVariable: 'dockerhubPassword', usernameVariable: 'dockerhubUser')]) {
                        sh "docker login -u ${env.dockerhubUser} -p ${env.dockerhubPassword}"
                        sh 'docker build . -t shadowshotx/product-go-micro'
                        sh 'docker push shadowshotx/product-go-micro'
                    }
                }
            }
        }
    }
    
    post {
        always {
            cleanWs() // Clean up workspace
        }
    }
}
