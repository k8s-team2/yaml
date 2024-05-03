#!/bin/bash
if kubectl get namespace frontend-ns >/dev/null 2>&1; then
    kubectl delete namespace frontend-ns
fi

if kubectl get namespace backend-ns >/dev/null 2>&1; then
    kubectl delete namespace backend-ns
fi

if kubectl get namespace database-ns >/dev/null 2>&1; then
    kubectl patch pvc mysql-pvc -p '{"metadata":{"finalizers":null}}' -n database-ns
    kubectl patch pvc mongo-pvc -p '{"metadata":{"finalizers":null}}' -n database-ns
    kubectl delete namespace database-ns
fi

if kubectl get namespace monitoring-ns >/dev/null 2>&1; then
    kubectl patch pvc monitoring-pvc -p '{"metadata":{"finalizers":null}}' -n monitoring-ns
    kubectl delete namespace database-ns
fi

kubectl create ns frontend-ns
kubectl create ns backend-ns
kubectl create ns database-ns
kubectl create ns monitoring-ns

kubectl apply -f .