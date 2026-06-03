#!/usr/bin/env groovy

library identifier: 'jenkins-shared-library@master', retriever: modernSCM(
    [$class: 'GitSCMSource',
     remote: 'https://github.com/OyinladeIbitoye/jenkins-shared-library.git',
     credentialsId: 'github-credentials'
    ]
)

pipeline {      
    agent any
    tools {
        maven 'Maven'
    }
    environment {
        IMAGE_NAME = 'oluwasparkle/demo-app:jma-3.0'
    }

    stages {
        stage ('build app') { 
            steps {
                script {
                  echo 'building applicatin jar...'
                  buildJar()
                }
            }
        }
        stage('build image') { 
            steps {
                script {
                    echo 'building docker image...'
                    buildImage(env.IMAGE_NAME)
                    dockerLogin()
                    dockerPush(env.IMAGE_NAME)
                }
            }
        }
        stage('deploy') {
            steps {
                script {
                    echo 'deploying docker image to EC2...'
                    def dockerComposeCmd = "docker-compose -f docker-compose.yaml up --detach"
                    sshagent(['ec2-server-key']) {
                        sh "scp docker-compose.yaml ec2-user@13.38.35.42:/home/ec2-user"
                        sh "ssh -o StrictHostKeyChecking=no ec2-user@13.38.35.42 ${dockerComposeCmd}"
                    }
                }
            }
        }     
    }    
}