#!/bin/bash


pipeline {
  agent any
// 	parameters {
//         gitParameter name: 'TAG',
//                      type: 'PT_TAG',
//                      defaultValue: 'master'
//     }
	
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
// 	    when { buildingTag() pattern: "\\d+", comparator: "REGEXP"}
//      	    when {
//             allOf {
//                 tag 'v*'
//             }
//         }
// 	    when {
//              $TAG_NAME 'v*'
//          }
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
	    sh '''
	    #!/bin/bash
	    COMMIT_ID=$(git rev-parse HEAD) 
	    TAG=$(git show-ref --tags | grep $COMMIT_ID | awk -F / '{print $3}')
	    if [ -z "$TAG" ] 
	    then 
	    echo Non-tag build
	    else 
	    echo $TAG
 	    kubectl apply -f nginx_pod.yaml --context kubernetes-admin@cluster.local
 	    fi
	    '''
	 } 
	    
//          echo 'Deploying only because this commit is tagged...'
// 	    sh ' ${param.TAG}'
	    
	   
       
// 	steps {   
//                     	def TAG_NAME = binding.variables.get("GIT_TAG_NAME")
// 			    if (TAG_NAME != null) {
// 				sh "echo $TAG_NAME"
// 			    } else {
// 				sh "echo Non-tag build"
// 			    }
//             }
    }
  }
}
