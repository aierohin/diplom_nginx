pipeline {
  agent any
  stages {
    stage('Build') {
      steps{
        sh ' echo env.TAG_NAME'
        sh 'docker build -t aierohin/nginx:latest .'
      }
    }
    stage('Push') {
      steps{
        sh 'docker push aierohin/nginx:latest'
      }
    }
    stage('Deploy') {
	when {
                expression {
                   env.TAG_NAME.toString().equals('v1.0.0')
                }
        }
        steps {
            echo 'Deploying only because this commit is tagged...'
	    sh 'kubectl apply -f nginx_pod.yaml '
        }                    
    }
  }
}
