pipeline {
    agent any
 
    parameters {
     choice(name: 'infra_state', choices: ["apply" , "destroy"], description: 'The environment is to apply or destroy infrastructure')
    }

    stages {

        stage("get public_ip & add authorized_net "){
              steps {
             
            //   sh   '''
            //    my_public_ip=$(curl ifconfig.me)   
            //    sed -i "s/Personal_Public_IP/$my_public_ip\\\\/32/"  infrastructure/compute-module/gke.tf 
            //    '''

               script {
                  def new_IP = sh(script: 'curl -s ifconfig.me', returnStdout: true).trim()
                  new_IP=new_IP+"/32"
                   print new_IP
                  
                  def newFile = new File("${WORKSPACE}/infrastructure/compute-module/gke.tf")

                   readMyFile=newFile.text
                   AfterReplace=readMyFile.replaceAll(/[0-9]+.[0-9]+.[0-9]+.[0-9]+\/32/,"${new_IP}")
                    
                    newFile.write (AfterReplace)
                
                   print newFile.text
                //   print test_pattern 
                
                }

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
