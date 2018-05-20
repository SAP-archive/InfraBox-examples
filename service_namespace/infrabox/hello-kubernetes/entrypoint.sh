#!/bin/bash -e
SERVICE_NAME="my-namespace"

CA_CRT="/var/run/infrabox.net/services/$SERVICE_NAME/ca.crt"

ENDPOINT=$(cat /var/run/infrabox.net/services/$SERVICE_NAME/endpoint)
NAMESPACE=$(cat /var/run/infrabox.net/services/$SERVICE_NAME/namespace)
TOKEN=$(cat /var/run/infrabox.net/services/$SERVICE_NAME/token)

kubectl config set-cluster $SERVICE_NAME \
    --server=$ENDPOINT \
    --certificate-authority=$CA_CRT

kubectl config set-credentials admin \
    --certificate-authority=$CA_CRT \
    --token=$TOKEN

kubectl config set-context default-system \
    --cluster=$SERVICE_NAME \
    --user=admin

kubectl config use-context default-system

# Install helm
helm init --tiller-namespace $NAMESPACE

# wait for tiller to be ready
sleep 20

helm --tiller-namespace $NAMESPACE --namespace $NAMESPACE install --wait --set persistence.enabled=false stable/postgresql

helm --tiller-namespace $NAMESPACE --namespace $NAMESPACE ls
