#!/usr/bin/env sh
set -eu

if [ "$#" -ne 1 ]; then
  echo "Usage: $0 <expected-image-uri>" >&2
  exit 2
fi

expected_image="$1"

argocd app wait threat-composer --sync --health --timeout 600
kubectl rollout status deployment/threat-composer --timeout=10m

actual_image="$(kubectl get deployment threat-composer -o jsonpath='{.spec.template.spec.containers[?(@.name=="threat-composer")].image}')"

if [ "${actual_image}" != "${expected_image}" ]; then
  echo "Expected ${expected_image}, but the Deployment uses ${actual_image}." >&2
  exit 1
fi

echo "Argo CD is Synced/Healthy and Kubernetes rolled out ${actual_image}."
