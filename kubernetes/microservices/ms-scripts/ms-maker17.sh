#!/bin/bash

# Save the current working directory
original_dir=$(pwd)

# Loop through each subdirectory
for dir in */ ; do
    # Enter the subdirectory
    cd "$dir"

    # Get the name of the current directory
    dir_name=$(basename "$(pwd)")
     git switch $branch_name

    # Create the Jenkinsfile
    cat > Jenkinsfile <<EOF
pipeline {
    agent any
    environment {
        DOCKERHUB_CREDENTIALS = credentials('djtoler-dockerhub')
    }
    
    stages {
        stage('Clean') {
            agent { label 'DockerAgent' } 
            steps {
              dir('docker') {
                sh '''#!/bin/bash
                echo "REMOVING IMAGES" 
                df -h
                df -h /tmp
                docker image ls
                docker ps
                docker rmi djtoler/qz-ms-$dir_name:latest || true
                docker images -f "dangling=true" -q | xargs docker rmi
                echo "FINISHED REMOVING IMAGES" 
              '''
              }
            }
        }
        stage('BuildBackImage') {
            agent { label 'DockerAgent' } 
            steps {
              dir('docker') {
                sh '''#!/bin/bash
                pwd
                echo "STARTING BACKEND BUILD" 
                cd back && pwd && docker build --no-cache -t djtoler/qz-ms-$dir_name:latest .
                echo "FINISHED BUILDING BACKEND"
              '''
              }
            }
        }
        
        stage('DockerLogin') {
            agent { label 'DockerAgent' } 
            steps {
                sh 'echo \$DOCKERHUB_CREDENTIALS_PSW | sudo docker login -u \$DOCKERHUB_CREDENTIALS_USR --password-stdin'
            }
        }

        stage('DockerHubPush') {
            agent { label 'DockerAgent' } 
            steps {
                sh 'echo "PUSHING TO DOCKERHUB1" '
                sh 'docker image ls'
                sh 'sudo docker push djtoler/qz-ms-$dir_name:latest'
            }
        }

        // stage('DockerComposeTest') {
        //     agent { label 'DockerAgent' } 
        //     steps {
        //         sh 'pwd && ls'
        //         // sh 'cd docker && pwd && ls'
        //         // sh 'cd docker && docker compose up'
        //     }
        // }

        stage('KubernetesRedeployPods') {
            agent { label 'KubernetesAgent' } 
            steps {
              dir('kubernetes') {
                sh '''#!/bin/bash
                ./redeploy-pods.sh
              '''
              }
            }
        }
    }
}
EOF

    # Go back to the original directory
    git add .
    git commit -m"added jenkins file"
    git push
    cd "$original_dir"
done
