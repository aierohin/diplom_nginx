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
        script {
          dockerImage = docker.build registry + ":$BUILD_NUMBER"
        }
      }
    }
    stage('Push') {
      steps{
        script {
          docker.withRegistry( '', registryCredential ) {
            dockerImage.push()
          }
        }
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