# Useful hints about K8s and Jenkins

These notes relate to useful troubleshooting of Jenkins trying to launch containers inside the K8s cluster.

## Checking that Jenkins can access the cluster

This might be useful to test if service account is working;

https://kubernetes.io/docs/tasks/run-application/access-api-from-pod/

See the curl bit at the bottom, excerpt below;

```bash
# Point to the internal API server hostname
APISERVER=https://kubernetes.default.svc

# Path to ServiceAccount token
SERVICEACCOUNT=/var/run/secrets/kubernetes.io/serviceaccount

# Read this Pod's namespace
NAMESPACE=$(cat ${SERVICEACCOUNT}/namespace)

# Read the ServiceAccount bearer token
TOKEN=$(cat ${SERVICEACCOUNT}/token)

# Reference the internal certificate authority (CA)
CACERT=${SERVICEACCOUNT}/ca.crt

# Explore the API with TOKEN
curl --cacert ${CACERT} --header "Authorization: Bearer ${TOKEN}" -X GET ${APISERVER}/api
```

Should return
```json
{
  "kind": "APIVersions",
  "versions": ["v1"],
  "serverAddressByClientCIDRs": [
    {
      "clientCIDR": "0.0.0.0/0",
      "serverAddress": "10.0.1.149:443"
    }
  ]
}
```


# Using minikube to view Jenkins UI

minikube tunnel --bind-address=*IP Address Of your machine running Minikube*