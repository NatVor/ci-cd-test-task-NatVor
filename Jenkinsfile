pipeline {
    agent any

    environment {
        DOCKER_IMAGE = 'flask-app'
    }

    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    docker.build(DOCKER_IMAGE)
                }
            }
        }

        stage('Run Container') {
            steps {
                script {
                    docker.image(DOCKER_IMAGE).run('-d -p 5000:5000')
                }
            }
        }

        stage('Test') {
            steps {
                script {
                    sh 'curl -f http://localhost:5000 || exit 1'
                }
            }
        }
    }
}
