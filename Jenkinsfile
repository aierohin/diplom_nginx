#!/bin/bash


pipeline {
  agent any
	options {
		buildDiscarder(
			logRotator(
			numToKeepStr: '10',
			artifactNumToKeepStr: '10'
			)
		)
		timestamps()
	}
  stages {
    stage('Build') {
      steps{
	echo "${currentBuild.number}"
        sh 'docker build -t aierohin/nginx:$BUILD_NUMBER .'
	
      }
    }
//     stage('Push') {
//       steps{
        
//       }
//     }
    stage('Push_Deploy') {
        steps {
	    sh '''
	    #!/bin/bash
	    docker push aierohin/nginx:$BUILD_NUMBER
	    COMMIT_ID=$(git rev-parse HEAD) 
	    TAG=$(git show-ref --tags | grep $COMMIT_ID | awk -F / '{print $3}')
	    if [ -z "$TAG" ] 
	    then 
	    echo Non-tag build
	    else 
	    echo $TAG
	    echo 'Deploying only because this commit is tagged...'
	    sudo kubectl set image deployment/nginx-deployment nginx=aierohin/nginx:$BUILD_NUMBER --kubeconfig /home/erohin/.kube/config
	    sudo kubectl rollout restart deployment nginx-deployment --kubeconfig /home/erohin/.kube/config
 	    fi
	    '''
	 }
    }
  }
}
