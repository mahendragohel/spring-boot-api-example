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
                steps {
                    sh 'docker build -t mahendragohel/springboot-api-example:latest .'
                }
            }
        }
        stage('Push Docker image') {
            environment {
                DOCKER_HUB_LOGIN = credentials('docker-hub')
            }
            steps {
                sh 'docker push -t mahendragohel/springboot-api-example:latest .'
            }
        }
    }
}
