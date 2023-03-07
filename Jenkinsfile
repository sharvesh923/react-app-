pipeline{
    agent any
    
    stages{
        stage('build npm artifact'){
            steps{
                sh 'npm install'
            }
        }
        stage('build image with build.sh'){
            steps{
                checkout scmGit(branches: [[name: '*/Dev']], extensions: [], userRemoteConfigs: [[url: 'https://github.com/sharvesh923/react-app-.git']])
                 sh 'chmod +x ./build.sh'
                 sh './build.sh'
            }
        }
        stage('push image to dev repo'){
            steps{
                withCredentials([string(credentialsId: 'Docker_username', variable: 'docker_username'), string(credentialsId: 'Docker_Cred', variable: 'docker_password')]) {
                 sh 'docker login -u sharvesh -p ${docker-pwd}'
                 sh 'docker tag react-app:latest dev/react-app:latest'
                 sh 'docker push dev/react-app:latest'
                }
            }
        }
    }
}
