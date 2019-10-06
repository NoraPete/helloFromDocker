pipeline {
	environment {
		registry = "np4519/ci-cd"
		registryCredential = 'norapete_dockerhub'
		dockerImage = ''
	}
	agent any
	stages {

		stage ('Checkout SCM') {
			steps {
				checkout scm
			}
		}

		stage ('Build') {
			steps {
				script {
          dockerImage = docker.build registry + ":$BUILD_NUMBER"
        }		
			}
		}

		stage ('Deploy to dockerhub') {
			steps {
				script {
					docker.withRegistry( '', registryCredential ) {
						dockerImage.push()
					}
				}
			}
		}

		stage ('Deploy to AWS') {
			steps {
				withAWS(region:'eu-west-2',credentials:'awsmalachite2') {
                                
                                }
			}
	
		}
	}
}
