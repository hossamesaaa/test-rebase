pipeline {
    agent any

     parameters {
     booleanParam(name: 'build', defaultValue: true, description: 'build and push python app')
     booleanParam(name: 'deploy', defaultValue: true, description: 'run python app')
    }
    
    stages {
    
    
        stage("build and push python app image "){

                when {
                        expression {
                            params.build == true
                        }
                }

                steps {
                sh """
                ls -ltr
                bash ${WORKSPACE}/app/python-app/docker_build.sh  
                """
                }
        }

        stage("run python app "){
                when {
                        expression {
                            params.deploy == true
                        }
                }

                steps {
                sh '''   
                    #!/bin/bash

                    cd app/python-deployment
                    
                    gcloud container clusters get-credentials hossam-eissa-project-gke \
                        --region=us-east5 \
                        --project=hossam-eissa-project 
                    
                    ls -ltr
                    
                    kubectl apply -f python-deployment.yaml
                    kubectl apply -f python-lb.yaml
                    sleep 50
                    public_ip=`kubectl get svc |  grep "LoadBalancer"  | awk -F" " '{print $4 }'`
                    echo "this is loadbalancer public ip ${public_ip} "
                    curl ${public_ip}
                        '''
                }
            }
        

        
    }
}
