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
        stage("trigger application pipeline "){
              steps {
             sh """   
                   echo "your build has been successeded"

                     """
               build job: "ITI_Final_project_application_pipeline", wait: true            
            
            }

        }

        
    }
}
