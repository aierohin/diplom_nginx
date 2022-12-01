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
        sh 'docker build -t aierohin/nginx":$BUILD_NUMBER" .'
      }
    }
    stage('Push') {
      steps{
        sh 'docker push aierohin/nginx":$BUILD_NUMBER"'
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
