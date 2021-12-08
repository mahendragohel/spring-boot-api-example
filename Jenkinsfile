pipeline {
    agent any

    triggers {
        pollSCM '* * * * *'
    }
 
    stages {
        stage('Build') {
            steps {
                sh './gradlew assemble'
            }
        }
        stage('Test') {
            steps {
                sh './gradlew test'
            }
        }
        stage('Build Docker Image'){
            steps{
                sh 'docker build -t springboot-api-example:latest .'
            }
        }
        stage('Push Docker image') {
            environment {
                DOCKER_HUB_LOGIN = credentials('docker-hub')
            }
            steps {
                sh 'docker push springboot-api-example:latest'
            }
        }
    }
}
