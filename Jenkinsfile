#!/usr/bin/env groovy

dev gv

pipeline {      
    agent none
    tools {
        maven 'Maven'
    }
    stages {
        stage ("init") { 
            steps{
                script{
                    gv = load "script.grrovy"
                }
            }
        }
        stage("build jar") { 
            steps{
                script{
                    gv.buildJar()
                }
            }
        }
        stage("build image") { 
            steps{
                script{
                    gv.buildImage()
                }
            }
        }
        stage("deploy") { 
            steps{
                script{
                    gv.deployApp()
                }
            }
        }
    }    
}
