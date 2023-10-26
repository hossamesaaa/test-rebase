#!/bin/bash

sudo docker build ${WORKSPACE}/app/python-app/Dockerfile -t asia-south2-docker.pkg.dev/hossam-eissa-project/docker-repository/python:v1

gcloud 

gcloud auth print-access-token \
    --impersonate-service-account sa-private-vm@hossam-eissa-project.iam.gserviceaccount.com | sudo docker login \
    -u oauth2accesstoken \
    --password-stdin https://asia-south2-docker.pkg.dev

sudo docker push asia-south2-docker.pkg.dev/hossam-eissa-project/docker-repository/python:v1

# gcloud config set project hossam-eissa-project
# gcloud builds submit --region=asia-south2 --config cloudbuild.yaml

