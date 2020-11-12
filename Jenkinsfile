pipeline {
    agent any
    stages {
        stage ('Build') {
            steps {
                echo 'Building...'
            }            
        }
        stage ('Test') {
            steps {
                echo 'Testing...'
            }            
        }
        stage ('Deploy') {
            steps {
                echo 'Deploying...'
            }            
        }
    }
}

pipeline {
  environment {
    imagename = "kevalnagda/flaskapp"
    registryCredential = 'kevalnagda'
    dockerImage = ''
  }
  agent any
  stages {
    stage('Cloning Git') {
      steps {
        git 'https://github.com/kevalnagda/movieapp.git'

      }
    }
    stage('Building image') {
      steps{
        script {
          dockerImage = docker.build imagename
        }
      }
    }
    stage('Deploy Image') {
      steps{
        script {
          docker.withRegistry( '', registryCredential ) {
            dockerImage.push("$BUILD_NUMBER")
             dockerImage.push('latest')

          }
        }
      }
    }
    stage('Remove Unused docker image') {
      steps{
        sh "docker rmi $imagename:$BUILD_NUMBER"
         sh "docker rmi $imagename:latest"

      }
    }
  }
}
