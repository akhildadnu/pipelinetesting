pipeline {
    agent any
    stages {

        stage('Clone Repo') {
          steps {
            sh 'rm -rf pipelinetesting_master'
            sh 'rm -rf pipelinetesting'
            sh 'git clone https://github.com/akhildadnu/pipelinetesting.git'
            }
        }

        stage('Build Docker Image') {
          steps {
            sh 'cd /var/lib/jenkins/workspace/pipelinetesting_master'
            sh 'docker build -t sreeharshav/pipelinetestmaster:v1 .'
            }
        }

        stage('Push Image to Docker Hub') {
          steps {
           sh    'docker push akhildandu/pipelinetestmaster:v2'
           }
        }

        stage('Deploy to Docker Host') {
          steps {
            sh    'docker -H tcp://10.0.28.151:2375 stop masterwebapp1 || true'
            sh    'docker -H tcp://10.0.28.151:2375 run --rm -dit --name masterwebapp1 --hostname masterwebapp1 -p 8000:80 akhildandu/pipelinetestmaster:v2'
            }
        }

        stage('Check WebApp Rechability') {
          steps {
          sh 'sleep 10s'
          sh ' curl http://10.0.28.151:8000'
          }
        }

    }
}

