pipeline {
    agent any

    environment {
        DOCKER_CREDENTIALS = 'dockerhub-credss'                     // DockerHub credentials ID in Jenkins
        DOCKER_IMAGE = 'arunkhrishnadocker/todoapp-image'           // Docker image name
        DOCKER_TAG = 'latest'                                       // Docker tag
        GIT_REPO = 'https://github.com/ArunKhrishna/To-Do-App-V.git' // GitHub repository
        GIT_BRANCH = 'main'                                         // Branch to deploy
    }

    stages {
        stage('Checkout Code') {
            steps {
                git url: "${GIT_REPO}", branch: "${GIT_BRANCH}"
            }
        }

        stage('Build Docker Image') {
            steps {
                bat "docker build -t ${DOCKER_IMAGE}:${DOCKER_TAG} ."
            }
        }

        stage('Push to Docker Hub') {
            steps {
                withCredentials([usernamePassword(credentialsId: "${DOCKER_CREDENTIALS}", usernameVariable: 'DOCKER_USER', passwordVariable: 'DOCKER_PASSWORD')]) {
                    bat """
                        docker login -u %DOCKER_USER% -p %DOCKER_PASSWORD%
                        docker push ${DOCKER_IMAGE}:${DOCKER_TAG}
                    """
                }
            }
        }

        stage('Notify Render') {
            steps {
                echo "Render will auto-deploy after the Docker image push."
            }
        }
    }

    post {
        always {
            bat 'docker logout' // Logs out of DockerHub after the push
        }
    }
}
