#!/usr/bin/env groovy

@Library('devops') _

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
	
//   options {
//   skipDefaultCheckout()
// }
  stages {
    stage('Build') {
      steps{
//         def TAG_NAME = binding.variables.get("GIT_TAG_NAME")
//             if (TAG_NAME != null) {
//                 sh "echo $TAG_NAME"
//             } else {
//                 sh "echo Non-tag build"
//             }
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
             tag '*'
         }
//	    when {
//                allOf {
//                    branch "main"
//                    buildingTag()
//                }
//            }
//         when {
//             tag comparator: 'EQUALS', pattern: 'v1.0.0'
//         }
// 	   when {
//   		environment name: 'GIT_TAG_NAME', value: 'v1.0.0'	
// 	   }
// 	   when {
//                 expression {
//                    GIT_TAG_NAME.toString().equals('v1.0.0')
//                 }
//         }
        steps {
            echo 'Deploying only because this commit is tagged...'
	    sh 'kubectl apply -f nginx_pod.yaml '
        }                    
    }
  }
}
