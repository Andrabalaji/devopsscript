pipeline{
    agent any
    stages{
        
        stage('Clone Repo') {
          steps {
            sh 'rm -rf devopsscript'
            sh 'git clone https://github.com/Andrabalaji/devopsscript.git'
            }
        }
        
        stage('Build Docker Image') {
          steps {
            sh 'cd /var/lib/jenkins/workspace/pipeline2/devopsscript'
            sh 'cp /var/lib/jenkins/workspace/pipeline2/devopsscript/* /var/lib/jenkins/workspace/pipeline2'  
            sh 'docker build -t andrabalu/pipeline:v1 .'
            }
        }

        stage('Push Image to Docker Hub') {
          steps {
            sh'docker push andrabalu/pipeline:v1'
            }
        }

        stage('Deploy to Docker Host') {
          steps {
            sh 'docker -H tcp://10.1.1.172:2375 stop masterwebapp1'
            sh 'docker -H tcp://10.1.1.172:2375 run --rm -dit --name masterwebapp1 --hostname masterwebapp1 -p 8000:80 andrabalu/pipeline1:v1'
            }
        }

        stage('Check WebApp Rechability') {
          steps {
            sh 'sleep 10s'
            sh ' curl http://10.1.1.172:8000'
            }
        }
    }
}
