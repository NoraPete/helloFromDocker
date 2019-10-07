pipeline {
	environment {
		registry = "np4519/hello-from-docker-dev"
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
				when {
					branch 'dev'
				}
			steps {
				script {
					docker.withRegistry( '', registryCredential ) {
						dockerImage.push()
					}
				}
			}
		}

		stage ('Deploy to AWS') {
				when {
					branch 'master'
				}
			steps {
				withAWS(region:'eu-west-2',credentials:'awsmalachite2') {
                                	sh 'sh ./deploy.sh'
                                }
			}
	
		}
	}
}
