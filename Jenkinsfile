pipeline {
    agent any

    stages {
    
    
        stage("build and push python app "){
            steps {
             sh "bash app/python-app/docker_build.sh  "
            }
        }

        stage("run python app "){
            steps {
               sh """   
                  cd app/python-deployment
                  ls -ltr
                  kubectl apply -f python-deployment.yaml
                  kubectl apply -f python-lb.yaml
                  kubectl get svc

                    """
               }
            }
        

        
    }
}
