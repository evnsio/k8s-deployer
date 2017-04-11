## Overview

Builds docker image containing `kubectl` and `helm`.

## Build

`docker-compose build`

## Usage

### Mount Kubeconfig into container

If you have a `kubeconfig` file, you can mount it at `/root/.kube/config` where `kubectl` and `helm` pick it up. 

E.g.  

`docker-compose run --rm k8s-deployer-mount "kubectl get no"`    
`docker-compose run --rm k8s-deployer-mount "helm list"`  

### Pass environment variables

Update the env vars in the docker-compose.yml to include the values present in your kubeconfig file.   

E.g.  

`docker-compose run --rm k8s-deployer-env "kubectl get no"`  
`docker-compose run --rm k8s-deployer-env "helm list"`