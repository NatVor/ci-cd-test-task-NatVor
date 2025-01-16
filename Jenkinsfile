pipeline {
    agent any

    environment {
        DOCKER_IMAGE = 'test-image'
        DOCKER_IMAGE_VERSION = 'v1.0'
        CONTAINER_NAME = 'app-container'
        VOLUME_NAME = 'app-data'
    }

    triggers {
        githubPush()
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
                    docker.build("${DOCKER_IMAGE}:${DOCKER_IMAGE_VERSION}")
                }
            }
        }

        stage('Run Container') {
            steps {
                script {
                    sh "docker stop ${CONTAINER_NAME} || true"
                    sh "docker rm -f ${CONTAINER_NAME} || true"
                    docker.image("${DOCKER_IMAGE}:${DOCKER_IMAGE_VERSION}").run("-d --name ${CONTAINER_NAME} -p 5000:5000 -v ${VOLUME_NAME}:/app/data")
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
