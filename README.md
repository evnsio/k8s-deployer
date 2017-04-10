## Overview

Builds docker image containing `kubectl` and `helm`.

## Build

`docker-compose build`

## Usage

Update the env vars in the docker-compose.yml to include the values present in your kubeconfig file.   

`docker-compose run --rm k8s-deployer "kubectl get no"`  
`docker-compose run --rm k8s-deployer "helm list"`