pipeline {

agent any

    stages {
             

        stage('tests') {

                    steps {

                                    sh "python3 -m venv venv && . venv/bin/activate && python3 -m pip install -e '.[test]' && coverage run -m pytest && coverage report"
                               
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