pipeline {
    agent any

    stages {
    
        stage("apply infracture"){
              steps {
             sh """   
                   cd infrastructure/compute-module
                   terraform init
                   terraform apply -auto-approve

                     """
            }

        }
        stage("test success"){
              steps {
             sh """   
                   echo "your build has been successeded"
                   
                     """
            }

        }

        
    }
}
