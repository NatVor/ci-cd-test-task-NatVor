pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }
        stage('Build Docker Image') {
            steps {
                script {
                    docker.build("flask-app")
                }
            }
        }
        stage('Run Container') {
            steps {
                sh 'docker-compose up -d'
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
