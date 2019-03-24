# vanhackathon-tractionguest-amazing-solution

This application was made to integrate directly with the Traction Guest VMS experience.

The idea is for Vehicular Documents Payers here in Brazil to use VMS with their costumer, where they would fill the information about their car plate, activating web-crawlers/database searchs.

That makes the whole process quicker to the Document Payer, because when they do those researchs manually, they spent several minutes with the client just understanding what is their sittuation and  have to search those informations in several websites.

## Infrastructure

The app is running on docker, on GKE (a kubernetes cluster managed by google), on google cloud.
The environment is defined in terraform. It installs jenkins and the Ruby app from the container image.

To reproduce the environment:
- create google cloud account
- create iam account and project for terraform to access
	IAM & Admin > Service Accounts, and click Create Service Account.
	download the service account json and save it with the name account.json on the devops/infrasctructure dir
- activate kubernetes API
- activate database API
- activate functions API
- install terraform - there is a bash script for that, in the folder scripts
- install and configure google cloud cli - there is also a script for that, for ubuntu 16.04
- change the project ID on infrastructure/provider.tf file
- ```cd devops/infrastructure```
- ```terraform init```
- ```terraform plan```
- ```terraform apply```

# Build and deploy
The build was supposed to be on jenkins, but it will be done in a future work.
Currently, the deploy of new versions must be done mannually, executing the following commands (replace <tag> with the tag to deploy, and <project_id> with the GPC project ID) :
- ```cd devops/pipeline```
- ```cp -r ../../src/vehicle-research/* .```
- ```docker build -t vhast .```
- ```docker tag vhast:latest gcr.io/<project_id>/vhast:<tag>```
- ```docker push gcr.io/<project_id>/vhast:<tag>```

As soon as the image is done, replace the tag on the terraform file k8s.tf, at line 62, and execute:
- ```terraform apply```

# How to use it

## API

### Endpoints

__POST__ search

Starts the search in the web-crawlers/databases for the vehicle with the same plate send in the body

#### Body
    {
	    "plate":"AAA0001"
    }


#### Response
__HTTP CODE 204__ if nothing for that plate is found

__HTTP CODE 200 with the Vehicle JSON__ 

## Traction Guest

To use that experience in Traction Guest, please refer to the experience __https://account.tractionguest.com/#/Experience/11768__ or the screenshot __experience.jpeg__ in the root of this project 