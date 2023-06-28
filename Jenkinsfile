pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                git branch: 'main', url: 'https://github.com/B-Altaleb/covid-tracker-bayan.git'
            }
        }
        
        stage('Build') {
            steps {
                sh 'docker build -t bayanaltaleb/covidtracker-bayan:6.0 .' 
            }
        }
        
//        stage('Test') {
//            steps {
//                sh 'docker run bayanaltaleb/covidtracker-bayan:6.0 npm test' 
//            }
//        }
        
        stage('Push') {
            steps {
                withCredentials([usernamePassword(credentialsId: 'bayan-docker-credentials', passwordVariable: 'DOCKER_PASSWORD', usernameVariable: 'DOCKER_USERNAME')]) {
                    sh 'echo $DOCKER_PASSWORD | docker login --username $DOCKER_USERNAME --password-stdin'
                    sh 'docker push bayanaltaleb/covidtracker-bayan:6.0' 
                }
            }
        }
        
        stage('Deploy to port 3000') {
            steps {
                sh 'docker run -d -p 3000:80 bayanaltaleb/covidtracker-bayan:6.0'
            }
        }

//        stage('Deploy') {
//            steps {
//                sh 'kubectl apply -f deployment.yaml'
//            }
//        }
    }
}
