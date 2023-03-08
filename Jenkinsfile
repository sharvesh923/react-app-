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
            steps{
                scripts{
                    withCredentials([string(credentialsId: 'Docker_username', variable: 'docker_username'), string(credentialsId: 'Docker_Cred', variable: 'docker_password')]) {
                        sh 'sudo docker login -u sharvesh923 -p ${docker_password}'
                        if (env.BRANCH_NAME == 'Dev'){
                            def image_name= "sharvesh923/dev:react-app"
                            sh 'sudo docker tag react-app:latest ${image_name}'
                            sh 'sudo docker push ${image_name}:${env.BUILD_ID}'
                            echo "images pushed to Dev repo"
                        }else if (env.BRANCH_NAME == 'master'){
                            def image_name= "sharvesh923/prod:react-app"
                            sh 'sudo docker tag react-app:latest ${image_name}'
                            sh 'sudo docker push ${image_name}:${env.BUILD_ID}'
                            echo "images pushed to Prod repo"
                            
                        }
                    }
                }
            }
        }
    }
}
