pipeline {
    agent any

    environment {
        // Define the path to your Go workspace
        GOPATH = '/path/to/your/go/workspace'
        // Define the relative path to your Go source code directory from the workspace root
        GO_SRC_PATH = 'src'
    }

    stages {
        stage('Build Go App') {
            steps {
                // Change directory to the Go source code directory
                dir("${GOPATH}/${GO_SRC_PATH}") {
                    // Build the Go application
                    sh 'go build -o myapp'
                }
            }
        }

        stage('Run Go App') {
            steps {
                // Change directory to the Go source code directory
                dir("${GOPATH}/${GO_SRC_PATH}") {
                    // Run the Go application as a background service
                    sh 'nohup ./myapp -port=8070 &'
                }
            }
        }

        // Add more stages as needed for testing, deployment, etc.
    }
}
