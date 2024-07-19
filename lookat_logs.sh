#!/bin/bash

# Get the list of all pods
pods=$(kubectl get pods --no-headers -o custom-columns=":metadata.name")

# Loop through each pod and get the logs, then filter for errors
for pod in $pods; do
  echo "Logs for pod: $pod"
  kubectl logs $pod | grep -i error
  echo ""
done
