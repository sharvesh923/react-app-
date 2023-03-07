pipeline{
    agent any
    
    stages{
        stage('build npm artifact'){
            steps{
                checkout scmGit(branches: [[name: '*/Dev']], extensions: [], userRemoteConfigs: [[url: 'https://github.com/sharvesh923/react-app-.git']])
                sh 'npm install'
            }
        }
        stage('build image with build.sh'){
            steps{
                checkout scmGit(branches: [[name: '*/Dev']], extensions: [], userRemoteConfigs: [[url: 'https://github.com/sharvesh923/react-app-.git']])
                sh './build.sh'
            }
        }
        stage('push image to dev repo'){
            step{
                withCredentials([string(credentialsId: 'docker-hub-pwd', variable: 'docker-pwd')]) {
                 sh 'docker login -u sharvesh -p ${docker-pwd}'
                 sh 'docker tag react-app:latest dev/react-app:latest'
                 sh 'docker push dev/react-app:latest'
                }
            }
        }
    }
}