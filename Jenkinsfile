pipeline {
    agent any

     parameters {
     booleanParam(name: 'build_&_push', defaultValue: true, description: 'build and push python app')
     booleanParam(name: 'deploy_app', defaultValue: true, description: 'run python app')
    }
    
    stages {
    
    
        stage("build and push python app "){

                when {
                        expression {
                            params.build_&_push == true
                        }
                }

                steps {
                sh """
                pwd
                ls -ltr
                //  echo "the workspace is ${WORKSPACE} "
                //  echo "the JENKINS_HOME is ${JENKINS_HOME}"
                bash ${WORKSPACE}/app/python-app/docker_build.sh  
                """
                }
        }

        stage("run python app "){
                when {
                        expression {
                            params.deploy_app == true
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
