pipeline {
    agent any
    environment {
        DOCKER_CREDENTIALS_ID = '8594ff72-a3e0-46e2-8b18-f15e62f0d18f' 
        DEV_DOCKER_REPO = 'ramya634/dev'
        PROD_DOCKER_REPO = 'ramya634/prod'
        DOCKER_IMAGE_TAG = 'latest'
    }
    stages {
        stage('Checkout') {
            steps {
                git branch: env.BRANCH_NAME, url: 'https://github.com/riyavarma123/capstone_project.git'
            }
        }
        stage('Build Docker Image') {
            steps {
                script {
                    def repo = (env.BRANCH_NAME == 'master') ? "${PROD_DOCKER_REPO}" : "${DEV_DOCKER_REPO}"
                    docker.build("${repo}:${DOCKER_IMAGE_TAG}")
                }
            }
        }
        stage('Push Docker Image') {
            steps {
                script {
                    def repo = (env.BRANCH_NAME == 'master') ? "${PROD_DOCKER_REPO}" : "${DEV_DOCKER_REPO}"
                    docker.withRegistry('', "${DOCKER_CREDENTIALS_ID}") {
                        docker.image("${repo}:${DOCKER_IMAGE_TAG}").push()
                    }
                }
            }
        }
    }
    post {
        always {
            cleanWs()
        }
    }
}

