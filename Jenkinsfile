pipeline {
  agent any
//   options {
//   skipDefaultCheckout()
// }
  stages {
    stage('Build') {
      steps{
        def TAG_NAME = binding.variables.get("TAG_NAME")
            if (TAG_NAME != null) {
                sh "echo $TAG_NAME"
            } else {
                sh "echo Non-tag build"
            }
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
            tag comparator: 'EQUALS', pattern: 'v1.0.0'
        }
// 	when {
//                 expression {
//                    env.GIT_TAG_NAME.toString().equals('v1.0.0')
//                 }
//         }
        steps {
            echo 'Deploying only because this commit is tagged...'
	    sh 'kubectl apply -f nginx_pod.yaml '
        }                    
    }
  }
}
