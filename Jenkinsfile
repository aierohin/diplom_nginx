pipeline {
  environment {
    registry = "aierohin/nginx"
    registryCredential = 'Dockerhub'
    dockerImage = ''
  }
  agent any
  stages {
    stage('Build') {
      steps{
        sh 'docker build -t aierohin/nginx:latest .'
      }
    }
    stage('Push') {
      steps{
        sh 'docker push aierohin/nginx:latest'
      }
    }
    stage('Deploy') {
        when { tag "release-*" }
        steps {
            echo 'Deploying only because this commit is tagged...'
	    sh 'make deploy'
        }                    
    }
  }
}
