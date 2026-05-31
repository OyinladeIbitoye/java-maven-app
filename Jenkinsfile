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
        stage('increment version') {
            steps {
                script {
                    echo 'incrementing app version...'
                    sh 'mvn build-helper:parse-version versions:set \
                        -DnewVersion=\\\${parsedVersion.majorVersion}.\\\${parsedVersion.minorVersion}.\\\${parsedVersion.nextIncrementalVersion} \
                        versions:commit' 
                    def matcher = readFile('pom.xml') =~ '<version>(.+)</version>'
                    def version = matcher[0][1]
                    env.IMAGE_NAME = "$version-$BUILD_NUMBER"
                }
            }
        }
        stage ('build app') { 
            steps {
                script {
                    echo "building the application.."
                    sh 'mvn clean package'
                }
            }
        }
        stage('build image') { 
            steps {
                script {
                   echo "building the docker image..."
                    withCredentials([usernamePassword(credentialsId: 'docker-hub-repo', passwordVariable: 'PASS', usernameVariable: 'USER')]) {
                        sh "docker build -t oluwasparkle/demo-app:${IMAGE_NAME} ."
                        sh "echo $PASS | docker login -u $USER --password-stdin"
                        sh "docker push oluwasparkle/demo-app:${IMAGE_NAME}"
                    }
                }
            }
        }   
        stage('deploy') { 
            steps {
                script {
                    echo 'deploying docker image to EC2...'
                }
            }
        }
        stage('commit version update') {
            steps {
                script {
                    sshagent(credentials: ['github-ssh']) {
                        sh '''
                            git config user.email "jenkins@example.com"
                            git config user.name "jenkins"

                            git remote set-url origin git@github.com:OyinladeIbitoye/java-maven-app.git

                            # ALWAYS start clean on correct branch
                            git fetch origin
                            git checkout -B jenkins-jobs origin/jenkins-jobs

                            git status

                            git add pom.xml
                            git commit -m "ci: version bump" || echo "No changes to commit"

                            git push origin jenkins-jobs
                        '''
                    }
                }
            }
        }

    }    
}
