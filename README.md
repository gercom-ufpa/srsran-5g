# SRSRAN-5G

## Implementations

- Monolitic gNodeB (OK);

## Requirements

- Kubernetes;
- Helm;

## Getting Starting

### Deploy a monolitic gNodeB

```sh
cd helm-chart
helm upgrade --install srsran-5g -n srsran . --create-namespace -f values-testbed.yaml
```

## Clean up

```sh
helm uninstall -n srsran srsran-5g && kubectl delete ns srsran
```