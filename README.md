# SRSRAN-5G

## Implementations

- Monolitic gNodeB (OK);

## Requirements

- Kubernetes;
- Helm;

## Getting Starting

### Deploy a monolitic gNodeB

- Docker

```sh
docker container run -d --name srsran-gnb -v <your-config>:/usr/local/srsran/configs/gnb_zmq.yml muriloavlis/srsran-5g:zmq_latest
```

- Helm

```sh
cd charts/srsran-5g
helm upgrade --install srsran-gnb -n srsran --create-namespace . -f <your-values>
```

### Deploy a SRSUE

```sh
docker container run -d --name srsue -v <your-config>:/etc/srsue/ue_zmq.conf muriloavlis/srsran-ue:latest
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