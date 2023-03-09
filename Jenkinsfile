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
                 sh 'npm run build'
                 sh 'chmod +x ./build.sh'
                 sh './build.sh'
            }
        }
        stage('push image to dev repo'){
             when {
              expression { BRANCH_NAME == 'Dev' }
            }
            steps{
                withCredentials([string(credentialsId: 'Docker_username', variable: 'docker_username'), string(credentialsId: 'Docker_Cred', variable: 'docker_password')]) {
                sh 'chmod +x ./deploy.sh'
                sh './deploy.sh'
                }
            }
        }
        stage('push image to Prod repo'){
            when {
              expression { BRANCH_NAME == 'master' }
            }
            steps {
                withCredentials([string(credentialsId: 'Docker_username', variable: 'docker_username'), string(credentialsId: 'Docker_Cred', variable: 'docker_password')]) {
                 sh 'sudo docker login -u sharvesh923 -p ${docker_password}'
                 sh 'sudo docker tag react-app:latest sharvesh923/prod:react-app-1'
                 sh 'sudo docker push sharvesh923/prod:react-app-1'
                 echo "images pushed to Prod repo"
                }           
            }
        }    
    }
}
