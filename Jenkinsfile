pipeline {
    agent any
    parameters {
        string(name: 'Yourname', defaultValue: 'Jenkins', description: 'Who are you?')
    }
    environment {
        jenkinsVariable = 'I am Jenkins'
    }

    stages {
        stage('Hello') {
            steps {
                sh """
                    echo "Hello World"
                    echo "${jenkinsVariable}"
                """
                script {
                    // Groovy code
                    def myjobs = ['steve', 'mike']
                    for ( int i = 0; i < myjobs.size(); i++) {
                        echo "${myjobs[i]} jobs"
                    }
                }
            }
        }
        stage('Goodbye') {
            when {
                environment name: 'Yourname', value: 'Jenkins'
            }
            steps {
                sh '''
                    echo "Goodbye"
                '''
            }
        }
    }
}
