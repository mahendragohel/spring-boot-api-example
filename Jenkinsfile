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
        stage('Build Image'){
            steps{
                node{
                    docker.build('spring-boot-api:{env.BUILD_ID}');
                }
            }
        }
    }
}