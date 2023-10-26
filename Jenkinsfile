pipeline {
    agent any

    stages {
    
    
        stage("build and push python app "){
            steps {
             sh """
             pwd
             ls -ltr
             echo "the workspace is ${WORKSPACE} "
             echo "the JENKINS_HOME is ${JENKINS_HOME}"
             bash ${WORKSPACE}/app/python-app/docker_build.sh  
             """
            }
        }

        stage("run python app "){
            steps {
               sh '''   
                  #!/bin/bash
                  gcloud=/var/lib/jenkins/google-cloud-sdk/bin/gcloud

                  cd app/python-deployment
                   
                  ${gcloud} container clusters get-credentials hossam-eissa-project-gke \
                    --region=us-east5 \
                    --project=hossam-eissa-project 
                  
                  ls -ltr
                   
                   kubectl apply -f python-deployment.yaml
                   kubectl apply -f python-lb.yaml

                   kubectl get svc 
                     '''
               }
            }
        

        
    }
}
