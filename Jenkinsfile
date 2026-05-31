pipeline {      
    agent any
    stages {
        stage('test') {
            steps {
                script {
                    echo "Testing the application..."
                    echo "testing ....."
                }
            }
        }
        stage('build') { 
            steps {
               script {
                   echo "Building the application..."
                   echo "some changes to trigger build"
                }
            }
        }

        stage('deploy') {
            steps {
                script {
                   def dockerCmd = 'docker run -p 3080:3080 -d oluwasparkle/k8s-demo-app:1.1'
                    sshagent(['ec2-server-key']) {
                        sh "ssh -o StrictHostKeyChecking=no ec2-user@13.38.35.42 ${dockerCmd}"
                    }
               }
            }
        }         
    }
}
