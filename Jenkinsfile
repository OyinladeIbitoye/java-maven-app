#!/usr/bin/env groovy

// library identifier: 'jenkins-shared-library@master', retriever: modernSCM(
//     [$class: 'GitSCMSource',
//      remote: 'https://github.com/OyinladeIbitoye/jenkins-shared-library.git',
//      credentialsId: 'github-credentials'
//     ]
// )
// def gv
pipeline {      
    agent any
    tools {
        maven 'Maven'
    }
    stages {
        stage ('build app') { 
            steps {
                script {
                    echo "building the application.."
                    sh 'mvn package'
                }
            }
        }
        stage("build image") { 
            steps {
                script {
                   echo "building the docker image..."
                    withCredentials([usernamePassword(credentialsId: 'docker-hub-repo', passwordVariable: 'PASS', usernameVariable: 'USER')]) {
                        sh 'docker build -t oluwasparkle/demo-app:jma-2.0 .'
                        sh "echo $PASS | docker login -u $USER --password-stdin"
                        sh 'docker push oluwasparkle/demo-app:jma-2.0'
                    }
                }
            }
        }   
        stage("deploy") { 
            steps {
                script {
                    echo 'deploying docker image to EC2...'
                }
            }
        }
    }    
}