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
                sh "docker build -t springboot-api-example:${env.BUILD_ID} ."
            }
        }
        stage('Push Docker image') {
            environment {
                DOCKER_HUB_LOGIN = credentials('docker-hub')
            }
            steps {
                sh "docker push mahendragohel/springboot-api-example:${env.BUILD_ID}"
            }
        }
    }
}
