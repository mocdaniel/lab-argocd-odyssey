#! /bin/sh

# create user-local bin directory; it's already part of $PATH
mkdir -p /home/eduk8s/bin

# get CLI from GitHub release and install it to /home/eduk8s/bin
curl -sLo /home/eduk8s/bin/argocd https://github.com/argoproj/argo-cd/releases/download/v2.10.6/argocd-linux-amd64
chmod 755 /home/eduk8s/bin/argocd

# source autocompletion
source <(argocd completion bash)
