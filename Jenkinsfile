pipeline {
    environment {
        registry = "irakholla/jen_web:web"
        registryCredential = 'dockerhub_login'
    }
    agent any
    stages {
        stage('test') {
           steps {
            sh """
              python3 -m venv venv
              . venv/bin/activate
              pip install -e .
              export FLASK_APP=js_example
              LC_ALL=en_US.utf8
              export LC_ALL
              pip install -e '.[test]'
              coverage run -m pytest
              coverage report
            """
           }
        }
        stage('build') {
            steps {
                script {
                    dockerImage = docker.build registry
                }
            }
        }
        stage('push') {
            steps {
                script {
                    docker.withRegistry( '', registryCredential ) {
                    dockerImage.push()
                    }
                } 
            }
        }
    }
}


