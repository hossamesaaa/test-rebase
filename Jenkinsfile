pipeline {
    agent any

    stages {
    
        stage("stage 1"){
              steps {
             sh """   pwd 
                     ls -ltr  """
            }

        }

        stage('stage 2') {
          steps {
          checkout([$class: 'GitSCM',
                  branches: [[name: '*/main']],
                  userRemoteConfigs: [[url: 'git@github.com:yourusername/your-repo.git']],
                  extensions: [[$class: 'CloneOption', honorRefspec: true]]])
             sh """   pwd 
                     ls -ltr  """
             }
        }
    }
}
