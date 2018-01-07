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
    --namespace=$(cat /var/run/secrets/kubernetes.io/serviceaccount/namespace)

kubectl config use-context default-system

kubectl get pods
