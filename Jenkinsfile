pipeline {
    agent any

    stages {
        stage('Hello') {
        //   steps {
        //   checkout([$class: 'GitSCM',
        //           branches: [[name: '*/main']],
        //           userRemoteConfigs: [[url: 'git@github.com:yourusername/your-repo.git']],
        //           extensions: [[$class: 'CloneOption', honorRefspec: true]]])
    //   }
            steps {
             sh """   pwd 
                     ls -ltr  """
            }
        }
    }
}
