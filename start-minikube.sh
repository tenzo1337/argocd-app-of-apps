#!/bin/zsh
#service docker start
#minikube start
source ~/.zshrc 
kmk
#argocd
#helm repo add argo-cd https://argoproj.github.io/argo-helm
#helm dep update argocd/
helm template argo-cd | kubectl apply -f -
helm template charts/root-app | kubectl apply -f -
kubectl port-forward -n argocd svc/argocd-server 8080:443  &>/dev/null &
kubectl get secret -n argocd argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 -d
sleep 3
open -a "Google Chrome" http://localhost:8080
