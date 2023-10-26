pipeline {
    agent any
 
    parameters {
     choice(name: 'infra_state', choices: ["apply" , "destroy"], description: 'The environment is to apply or destroy infrastructure')
    }

    stages {
    
        stage("apply or destory infrastructure"){
              steps {
             sh """   
                   cd infrastructure/compute-module
                   terraform init
                   terraform ${params.infra_state} -auto-approve --target=google_container_cluster.project_gke_cluster
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
