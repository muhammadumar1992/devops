pipeline {
    agent any
    
    stages {
        stage('Checkout') {
            steps {
                git branch: 'master', url: 'https://github.com/muhammadumar1992/devops.git'
            }
        }
        stage('SonarQube Analysis') {
            environment {
                scannerHome = tool 'SonarQubeScanner'
            }
            steps {
                withSonarQubeEnv('sonarqube-10.5.1') {
                    sh """
                        ${scannerHome}/bin/sonar-scanner \
                        -Dsonar.host.url=http://sonarqube:9000 \
                        -Dsonar.projectKey=demo-app \
                        -Dsonar.sources=.
                    """
                }
            }
        }
        stage('Build Docker Image') {
            steps {
                sh 'docker build -t demo-app -f AppDockerfile .'
            }
        }
    }
    
    post {
        success {
            echo 'Pipeline completed successfully!'
        }
        failure {
            echo 'Pipeline failed!'
        }
    }
}
