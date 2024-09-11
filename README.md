# SRSRAN-5G

## Implementations

- Monolitic gNodeB (OK);

## Requirements

- Kubernetes;
- Helm;

## Getting Starting

### Deploy a monolitic gNodeB

```sh
cd charts/srsran-5g
helm upgrade --install srsran-gnb -n srsran --create-namespace . -f <your-values>
```

### Clean up

```sh
helm uninstall -n srsran srsran-gnb && kubectl delete ns srsran
```

## Values templates

|         Deploy            | **template**                                                 |
|---------------------------|--------------------------------------------------------------|
| srsran-gnb + srsue        |  [values-gnb-zmq.yaml](charts/srsran-5g/values-gnb-zmq.yaml) |
| srsran-gnb + multi-srsue  | TODO                                                         |
| srsran-gnb + FoxCom RU    | TODO                                                         |

## Problems To Be Investigated

- `SRSUE doesn't work with OAI-5G CN`: the tunnel interface isn't created during the GTP-U session establishment process;  