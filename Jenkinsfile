pipeline {
    agent any

    stages {
    
    
        stage("build python app "){
              steps {
             sh """   
                  bash app/python-app/docker_build.sh
                   
                     """
            }

        }

        
    }
}
