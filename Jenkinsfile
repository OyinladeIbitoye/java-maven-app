#!/usr/bin/env groovy

library identifier: 'jenkins-shared-library@master', retriever: modernSCM(
    [$class: 'GitSCMSource',
     remote: 'https://github.com/OyinladeIbitoye/jenkins-shared-library.git',
     credentialsId: 'github-credentials'
    ]
)

def gv
pipeline {      
    agent any
    tools {
        maven 'Maven'
    }
    stages {
        stage ("init") { 
            steps {
                script {
                    gv = load "script.groovy"
                }
            }
        }
        stage("build jar") { 
            steps {
                script {
                    buildJar()
                }
            }
        }
        stage("build and push image") { 
            steps {
                script {
                    buildImage 'oluwasparkle/demo-app:jma-3.0'
                    dockerLogin()
                    dockerPush 'oluwasparkle/demo-app:jma-3.0'
                }
            }
        }
        stage("deploy") { 
            steps {
                script {
                    gv.deployApp()
                }
            }
        }
    }    
}
