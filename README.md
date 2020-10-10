# Hi 
A small dockerized Flask app meant to showcase how to use Kubernetes `ConfigMap`s

## Setup description
The Hi App is a small Flask app which uses the `NAME` environment  variable to display a friendly greeting. 
This environment variable is mapped into the container via a `ConfigMap`. 

A Terraform plan is included to deploy this application to an existing Kubernetes cluster.

## Contents 
- hi - app source code
- Dockerfile - Multi-stage build to build and create an image for Hi
- requirements.txt - Hi app dependencies
- setup.py - Distutils installation script
- terraform - Deployment plan to an existing Kubernetes cluster
- .github/workflows/docker-image-publish.yml - GitHub actions to build and publish the Docker Image to the Docker Hub

## Disclaimer
***Showcase only, not production ready***
Ignores several best practices with regard to the quality of the code and promoting it to a production environment. 

For example:
- with regard to image versioning, it uses the `latest` floating tag which can cause unpredictable behavior
- contains no unit-tests and other quality checks to ensure production ready code
