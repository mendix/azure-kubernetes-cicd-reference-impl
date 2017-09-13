#!/bin/bash
########################################
# BEGIN Settings Section
########################################
# Set name of desired Azure Resource group
RESOURCE_GROUP=DevOps-Ref-Arch
# Select Azure location of created resources (as per "az account list-locations")
LOCATION=westeurope
# Select desired DNS prefix of cluster reosources
DNS_PREFIX=mx-devops-ref-arch
# Select desired name of cluster
CLUSTER_NAME=mx-devops-ref-arch
########################################
# END Settings Section
########################################
# Create Azure Resource Group for Cluster
az group create --name=$RESOURCE_GROUP --location=$LOCATION
# Create Azure Container Service cluster orchestrated using Kubernetes
az acs create --orchestrator-type=kubernetes --resource-group $RESOURCE_GROUP --name=$CLUSTER_NAME --dns-prefix=$DNS_PREFIX --generate-ssh-keys
# Install kubectl client locally
az acs kubernetes install-cli
# Get and store cluster credentials locally for subsequent usage by kubectl
az acs kubernetes get-credentials --resource-group=$RESOURCE_GROUP --name=$CLUSTER_NAME
