pipeline {

    environment {
        imagename = "pipetky/exam"
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
          dockerImage = docker.build("-f Dockerfile.webapp") imagename":agent"
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

                

        // stage('Publish reports') { 
        //     steps {
        //         cobertura  (
        //         onlyStable: false,
        //         enableNewApi: true,
        //         failUnhealthy: false,
        //         failUnstable: false,
        //         autoUpdateHealth: false,
        //         autoUpdateStability: false,
        //         zoomCoverageChart: false,
        //         maxNumberOfBuilds: 0,
        //         sourceEncoding: 'ASCII',
        //         coberturaReportFile: 'report/coverage.xml',
        //         lineCoverageTargets: '80, 0, 0',
        //         methodCoverageTargets: '80, 0, 0',
        //         conditionalCoverageTargets: '70, 0, 0'
        //         )
        //     }
        // }
        // stage('Build') { 
        //     steps {
        //         script {
        //                 sh 'python3 -m build'                   
        //         }
        //     }
        // }
        // stage('Publish artifact') { 
        //     steps {
        //         archiveArtifacts artifacts: 'dist/*.whl', fingerprint: false
        //     }
        // }
    }        
}