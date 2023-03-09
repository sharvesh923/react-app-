 sh 'sudo docker login -u sharvesh923 -p ${docker_password}'
                 sh 'sudo docker tag react-app:latest sharvesh923/dev:react-app'
                 sh 'sudo docker push sharvesh923/dev:react-app'
                 echo "images pushed to Dev repo."
