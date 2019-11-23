def remote = [:]
                remote.name = 'vm_ansible'
                remote.host = '192.168.1.109'
                remote.user = 'root'
                remote.password = 'P@ssw0rd'
                remote.allowAnyHosts = true
pipeline {
    environment {
        registry = "irakholla/jen_web:web"
        registryCredential = 'dockerhub_login'
    }
    agent any
    stages {
        stage('remote') {
           steps {
            sshCommand remote: remote, command: "yum update --nobest -y; yum install python3 -y; yum install git -y; dnf config-manager --add-repo=https://download.docker.com/linux/centos/docker-ce.repo; dnf install --nobest docker-ce -y; systemctl enable --now docker; git init; git pull https://github.com/irakholla/project.git; chmod '+x' jen/pipeline.sh; jen/pipeline.sh"
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

//sshCommand remote: remote, command: "docker build -t irakholla/jen_web:web . -f /root/jen/Dockerfile"
//sshCommand remote: remote, command: "docker push irakholla/jen_web:web"
