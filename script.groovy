def buildApp() {
    echo 'building the application...'
    sh 'mvn package'
}

def testApp() {
    echo 'testing the application......'
}

def deployApp() {
    echo 'deploying the application...'
    echo "deploying version ${params.VERSION}"
}

return this
