#!/bin/bash

docker build . -t asia-south2-docker.pkg.dev/hossam-eissa-project/docker-repository/python:v1

gcloud auth print-access-token \
    --impersonate-service-account sa-private-vm@hossam-eissa-project.iam.gserviceaccount.com | docker login \
    -u oauth2accesstoken \
    --password-stdin https://asia-south2-docker.pkg.dev

docker push asia-south2-docker.pkg.dev/hossam-eissa-project/docker-repository/python:v1

# gcloud config set project hossam-eissa-project
# gcloud builds submit --region=asia-south2 --config cloudbuild.yaml

