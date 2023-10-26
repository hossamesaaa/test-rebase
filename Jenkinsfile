pipeline {
    agent any
 
    parameters {
     choice(name: 'infra_state', choices: {"apply" , "destroy"}, description: 'The environment to apply or destroy infrastructure')
    }

    stages {
    
        stage("apply or destory infrastructure"){
              steps {
             sh """   
                   cd infrastructure/compute-module
                   terraform init
                   terraform ${params.infra_state} -auto-approve

                     """
            }

        }
        stage("trigger application pipeline "){
              steps {
             sh """   
                   echo "your ${params.infra_state} has been succeeded"

                     """
               build job: "ITI_Final_project_application_pipeline", wait: true            
            
            }

        }

        
    }
}
