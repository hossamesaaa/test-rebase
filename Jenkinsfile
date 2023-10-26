pipeline {
    agent any

    stages {
    
    
        stage("build and push python app "){
            steps {
             sh """
             pwd
             ls -ltr
             bash app/python-app/docker_build.sh  
             """
            }
        }

        stage("run python app "){
            steps {
               sh """   
                  cd app/python-deployment
                   
                  gcloud container clusters get-credentials hossam-eissa-project-gke \
                    --region=us-east5 \
                    --project=hossam-eissa-project 
                  
                  ls -ltr
                   
                   kubectl apply -f python-deployment.yaml
                   kubectl apply -f python-lb.yaml

                   kubectl get svc 
                     """
               }
            }
        

        
    }
}
