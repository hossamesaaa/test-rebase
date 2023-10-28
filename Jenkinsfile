pipeline {
    agent any
 
    parameters {
     choice(name: 'infra_state', choices: ["apply" , "destroy"], description: 'The environment is to apply or destroy infrastructure')
    }

    stages {

        stage("get public_ip & authorized_net "){
              steps {
             
              sh   '''
               my_public_ip=$(curl ifconfig.me)  
               sed -i "s/Personal_Public_IP/$my_public_ip\\\\/32/"  infrastructure/compute-module/gke.tf 
               '''

            }

        }
    
        stage("apply or destory infrastructure"){
              steps {
             sh """   
                   cd infrastructure/compute-module
                   terraform init
                   terraform ${params.infra_state} -auto-approve 

                   echo "your ${params.infra_state} has been succeeded"
                     """
            }

        }
        stage("trigger application pipeline "){

            when {
                    expression {
                        params.infra_state == 'apply'
                    }
            }
            
            steps {
                
               
                // Create an Approval Button with a timeout of 15minutes.
	            timeout(time: 24, unit: "HOURS") {
	                input message: 'Do you want to approve the deployment?', ok: 'Yes'
	            }
                
            
                build job: "ITI_Final_project_application_pipeline", wait: true            
            
            }

        }

        
    }
}
