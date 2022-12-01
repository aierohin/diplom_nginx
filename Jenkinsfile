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
	//when { tag pattern: "v1.0.0", comparator: "REGEXP"}  
	//when { tag 'v1.0.0' }
	//when { buildingTag('v1.0.0')}
	//when { tag pattern: "release-\\d+", comparator: "REGEXP"}
	when { branch 'master' }
        steps {
            echo 'Deploying only because this commit is tagged...'
	    sh 'kubectl apply -f nginx_pod.yaml '
        }                    
    }
  }
}
