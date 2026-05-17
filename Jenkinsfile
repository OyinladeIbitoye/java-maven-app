pipeline {   
    
    agent any
    tools {
        maven 'Maven'
    }
    stages {
        stage("build jar") { 
            steps {
               script {
                    echo "buiding the application...."
                    sh 'mvn package'
                }
            }
        }

        stage("build image") { 
            steps {
               script {
                    echo "buiding the docker image...."
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
                   echo "deploying the application...."
               }
            }
        }         
    }
} 
