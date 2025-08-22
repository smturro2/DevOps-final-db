pipeline {
    agent any

    environment {
        DOCKERHUB_CREDENTIALS = credentials("dockerhub")
        DOCKER_REGISTRY = "denture8278"
        DOCKER_NAME = "devops-final-db"
        DOCKER_HOST = 'unix:///var/run/docker.sock'  // this is needed to fix "Cannot connect to the Docker daemon" error
        // DOCKER_TAG = "${env.BUILD_NUMBER}"  // todo
        DOCKER_TAG = "v1.1"
    }

    stages {
        stage('Debug') {
            steps {
                script {
                    sh 'whoami'
                    sh 'env'
                    sh 'docker --version'
                    sh 'docker ps'
                }
            }
        }
        stage('Build') {
            steps {
                echo "todo"
            }
        }
        stage('Test') {
            steps {
                echo "todo"
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
                        DOCKER_TAG,
                        DOCKERHUB_CREDENTIALS_USR,
                        DOCKERHUB_CREDENTIALS_PSW,
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
