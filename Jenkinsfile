pipeline {
    agent any

    environment {
        DOCKER_HUB = "satya1426"
        IMAGE_NAME = "node-mongo-app"
        KUBECONFIG = '/home/satya/.kube/config'
        HOME = '/home/satya'
    }

    stages {

        stage('Build Docker Image') {
            steps {
                sh 'docker build -t $DOCKER_HUB/$IMAGE_NAME:latest .'
            }
        }

        stage('Push Docker Image') {
            steps {
                withCredentials([usernamePassword(credentialsId: 'dockerhub-creds', usernameVariable: 'USER', passwordVariable: 'PASS')]) {
                    sh 'echo $PASS | docker login -u $USER --password-stdin'
                    sh 'docker push $DOCKER_HUB/$IMAGE_NAME:latest'
                }
            }
        }

        stage('Deploy with Helm') {
            steps {
                sh 'helm upgrade --install node-mongo-app ./node-mongo-app'
            }
        }
    }
}

