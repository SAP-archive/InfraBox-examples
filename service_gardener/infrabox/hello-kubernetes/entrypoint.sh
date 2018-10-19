#!/bin/bash -e
SERVICE_NAME="my-cluster"

CA_CRT="/var/run/infrabox.net/services/$SERVICE_NAME/ca.crt"
CLIENT_CRT="/var/run/infrabox.net/services/$SERVICE_NAME/client.crt"
CLIENT_KEY="/var/run/infrabox.net/services/$SERVICE_NAME/client.key"

ENDPOINT=$(cat /var/run/infrabox.net/services/$SERVICE_NAME/endpoint)
PASSWORD=$(cat /var/run/infrabox.net/services/$SERVICE_NAME/password)
USERNAME=$(cat /var/run/infrabox.net/services/$SERVICE_NAME/username)

kubectl config set-cluster $SERVICE_NAME \
    --server=$ENDPOINT \
    --certificate-authority=$CA_CRT

kubectl config set-credentials admin \
    --certificate-authority=$CA_CRT \
    --client-certificate=$CLIENT_CRT \
    --client-key=$CLIENT_KEY \
    --username=$USERNAME \
    --password=$PASSWORD

kubectl config set-context default-system \
    --cluster=$SERVICE_NAME \
    --user=admin

kubectl config use-context default-system

kubectl get pods
