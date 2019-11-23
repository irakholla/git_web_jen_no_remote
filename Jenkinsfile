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
               yum update -y && \
               yum install python3 -y && \
               yum install git -y && \
               yum config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo && \
               yum install docker-ce -y && \
               systemctl enable --now docker && \
               git init; git pull https://github.com/irakholla/project.git && \
               chmod '+x' jen/pipeline.sh && \
               jen/pipeline.sh
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


