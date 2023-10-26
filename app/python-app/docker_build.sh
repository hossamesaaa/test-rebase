#!/bin/bash

# docker build . -t asia-south1-docker.pkg.dev/hossam-eissa-project/docker-repository/python:v1


gcloud config set project hossam-eissa-project
gcloud builds submit --region=asia-south1 --config cloudbuild.yaml

