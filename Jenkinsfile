#!/usr/bin/env groovy


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
// 	    when {
//         	expression {
//             		return env.GIT_TAG_NAME == '*';
//         		}
//     		}
// 	    when {
//                 buildingTag()
//             }
          when {
             tag 'v*'
         }
//	    when {
//                allOf {
//                    branch "main"
//                   buildingTag()
//                }
//           }
//         when {
//             tag comparator: 'EQUALS', pattern: '*'
//         }
// 	   when {
//    		environment name: 'GIT_TAG_NAME', value: '*'
// 		environment name: 'TAG_NAME', value: '*'
// 	   }
// 	   when {
// 		   environment(name: "GIT_TAG_NAME", value: "*")
//                expression {
//                    env.GIT_TAG_NAME.toString().equals('*')
//                  }
//       }
        steps {
            echo 'Deploying only because this commit is tagged...'
	    sh 'kubectl apply -f nginx_pod.yaml '
        }                    
    }
  }
}
