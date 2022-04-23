pipeline {
    environment {
        imagename = 'pipetky/exam'
        registryCredential = 'docker-hub'
        dockerImage = ''
    }

  agent any

    stages {
        stage('tests') {
            steps {
                sh "python3 -m venv venv && . venv/bin/activate && python3 -m pip install -e '.[test]' && coverage run -m pytest && coverage report"
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
                  dockerImage.push("agent")
                  }
            }
          }
        }

        stage('Remove Unused docker image') {
            steps{
                sh "docker rmi $imagename:agent"
            }
        }
    }        
}