pipeline {

agent any

    stages {

        stage('Checkout code') { 
            
            steps {
                checkout scm
            }
            
        }
        stage('install dependencies') { 
            
            steps {
                checkout scm
            }
            
        }
              

        stage('tests') {

                    steps {
                        withEnv{
                                    sh "pip install -e '.[test]'"
                                    sh "coverage run -m pytest"
                                    sh "coverage report"
                                }   
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