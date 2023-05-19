pipeline{
    agent any
    stages{

        stage('Clone Repo') {
            stages{
            sh 'rm -rf dockertest1'
            sh 'git clone https://github.com/mavrick202/dockertest1.git'
        }
        }

        stage('Build Docker Image') {
            stages{
            sh 'cd /var/lib/jenkins/workspace/pipeline1/dockertest1'
            sh 'cp /var/lib/jenkins/workspace/pipeline1/dockertest1/* /var/lib/jenkins/workspace/pipeline1'
            sh 'docker build -t andrabalu/pipeline1:v1 .'
        }
        }

        stage('Push Image to Docker Hub') {
            stages{
            sh'docker push andrabalu/pipeline1:v1'
        }
        }

        stage('Deploy to Docker Host') {
            stages{
            sh 'docker -H tcp://10.1.1.172:2375 run --rm -dit --name masterwebapp1 --hostname masterwebapp1 -p 8000:80 andrabalu/pipeline1:v1'
        }
        }

        stage('Check WebApp Rechability') {
            stages{
            sh 'sleep 10s'
            sh ' curl http://10.1.1.172:8000'
        }
        }
    }
}
