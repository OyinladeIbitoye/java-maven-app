pipeline {   
    
HEAD
    agent none

    agent any
    tools {
        maven 'Maven'
    }
e68bd10490e29bb8a078c5c72a3dedb8019e9931
    stages {
        stage('test') {
            steps {
                script {
                    echo "Testing the application..."
                    echo "Executing pipeline for branch $BRANCH_NAME"
                }
            }
        }
HEAD
        stage('build') { 
            when {
                expression {
                    BRANCH_NAME == 'master'
                }
            }
            steps {
               script {
                   echo "Building the application..."
=======
        stage("build jar") { 
            steps {
               script {
                   gv.buildJar()
>>>>>>> e68bd10490e29bb8a078c5c72a3dedb8019e9931
                }
            }
        }

<<<<<<< HEAD
        stage('deploy') {
            when {
                expression {
                    BRANCH_NAME == 'master'
=======
        stage("build image") { 
            steps {
               script {
                    gv.buildImage()
>>>>>>> e68bd10490e29bb8a078c5c72a3dedb8019e9931
                }
            }
            steps {
                script {
<<<<<<< HEAD
                   echo "Deploying the application..."
=======
                   gv.deployApp()
>>>>>>> e68bd10490e29bb8a078c5c72a3dedb8019e9931
               }
            }
        }         
    }
<<<<<<< HEAD
}
=======
}
>>>>>>> e68bd10490e29bb8a078c5c72a3dedb8019e9931
