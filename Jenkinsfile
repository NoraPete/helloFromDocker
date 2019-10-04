pipeline{
  environment{
  registry = "np4519/ci-cd"
  registryCredential = "norapete_dockerhub"
  dockerImage = ''
  }
  agent any
  stages{
    stage('Checkout SCM'){
      steps{
        checkout scm
        }
      }
    }
    stage('Build'){
      steps{
        script{
          dockerImage = docker.build registry + ":$BUILD_NUMBER"
        }
      }
    }
    stage('Deploy'){
      steps{
        script{
          docker.withRegistry( '', registryCredential ) {
          dockerImage.push()
          }
        }
      }
    }
    stage('Remove unused Docker image'){
      steps{
        sh "docker rmi $registry:$BUILD_NUMBER"
      }
    }
  }
}
