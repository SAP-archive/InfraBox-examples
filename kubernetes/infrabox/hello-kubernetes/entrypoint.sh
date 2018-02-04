#!/bin/bash -e

NAMESPACE=$(cat /var/run/secrets/kubernetes.io/serviceaccount/namespace)

kubectl config set-cluster default-cluster \
    --server=${INFRABOX_RESOURCES_KUBERNETES_MASTER_URL} \
    --certificate-authority=/var/run/secrets/kubernetes.io/serviceaccount/ca.crt

kubectl config set-credentials default-admin \
    --certificate-authority=/var/run/secrets/kubernetes.io/serviceaccount/ca.crt \
    --token=$(cat /var/run/secrets/kubernetes.io/serviceaccount/token)

kubectl config set-context default-system \
    --cluster=default-cluster \
    --user=default-admin \
    --namespace=$NAMESPACE

kubectl config use-context default-system

kubectl get pods

# Install helm
helm init --tiller-namespace $NAMESPACE

# wait for tiller to be ready
sleep 20

helm --tiller-namespace $NAMESPACE install --wait --set persistence.enabled=false stable/postgresql

helm --tiller-namespace $NAMESPACE ls
