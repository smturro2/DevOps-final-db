pipeline {
    agent any

    environment {
        DOCKER_REGISTRY = "your-docker-DOCKER_REGISTRY"
        DOCKER_NAME = "devops-final-web"
        DOCKER_TAG = "${env.BUILD_NUMBER}"
    }

    stages {
        stage('Build') {
            steps {
                script {
                    // todo
                }
            }
        }
        stage('Test') {
            steps {
                script {
                    // todo
                }
            }
        }
        stage('Security Scan') {
            steps {
                script {
                    utils.runStaticScan()
                }
            }
        }
        stage('Container Build') {
            steps {
                script {
                    utils.buildDocker(
                        DOCKER_REGISTRY, 
                        DOCKER_NAME, 
                        DOCKER_TAG
                    )
                }
            }
        }
        stage('Container Push') {
            steps {
                script {
                    utils.pushDocker(
                        DOCKER_REGISTRY, 
                        DOCKER_NAME, 
                        DOCKER_TAG
                    )
                }
            }
        }
        stage('Deploy') {
            steps {
                script {
                    utils.conditionalDeployment(
                        env.branchName
                    )
                }
            }
        }
    }
}
