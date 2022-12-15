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
    stage('Deploy') {
        steps {
	    sh '''
	    #!/bin/bash
	    COMMIT_ID=$(git rev-parse HEAD) 
	    TAG=$(git show-ref --tags | grep $COMMIT_ID | awk -F / '{print $3}')
	    if [ -z "$TAG" ] 
	    then 
	    echo Non-tag build
	    docker push aierohin/nginx:$BUILD_NUMBER
 	    else 
	    echo $TAG
	    echo 'Deploying only because this commit is tagged...'
	    sudo kubectl apply -f nginx_pod.yaml --kubeconfig /home/erohin/.kube/config
 	    fi
	    '''
	 }
    }
  }
}
