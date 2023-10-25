#! /bin/bash

# install tinyproxy
tinyproxy_status=`systemctl is-active tinyproxy`
if [[ tinyproxy_status != active ]]; then 
  if [[ ! -f /lib/systemd/system/tinyproxy.service ]]; then 
    sudo apt-get update
    sudo apt-get install -y tinyproxy
    sudo chmod 777 /etc/tinyproxy/tinyproxy.conf
    sudo echo 'Allow localhost' >> /etc/tinyproxy/tinyproxy.conf
    sudo systemctl restart tinyproxy  
  fi
fi


# install docker  
docker_status=`systemctl is-active docker`
if [[ docker_status != active  ]]; then 
  if [[ ! -f /lib/systemd/system/docker.service  ]]; then 
  #install docker 
    sudo apt update -y 
    sudo apt install apt-transport-https ca-certificates gnupg2 software-properties-common -y
    curl -fsSL https://download.docker.com/linux/debian/gpg | sudo apt-key add -
    sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/debian $(lsb_release -cs) stable"
    sudo apt update
    apt-cache policy docker-ce
    sudo apt install docker-ce -y
    # sudo usermod -aG docker ${USER}
    sudo systemctl restart docker
    sudo usermod -aG docker hossam
    
    #install kubectl 
    sudo apt-get install google-cloud-sdk-gke-gcloud-auth-plugin -y
    sudo apt-get  install kubectl -y

    #install helm
    curl https://baltocdn.com/helm/signing.asc | gpg --dearmor | sudo tee /usr/share/keyrings/helm.gpg > /dev/null
    sudo apt-get install apt-transport-https --yes
    echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/helm.gpg] https://baltocdn.com/helm/stable/debian/ all main" | sudo tee /etc/apt/sources.list.d/helm-stable-debian.list
    sudo apt-get update
    sudo apt-get install helm

    #docker authentication
    gcloud auth print-access-token \
    --impersonate-service-account sa-private-vm@hossam-eissa-project.iam.gserviceaccount.com | docker login \
    -u oauth2accesstoken \
    --password-stdin https://us-east4-docker.pkg.dev

    fi
  
  sudo usermod -aG docker hossam
fi    