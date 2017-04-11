#!/bin/sh

KUBECONFIG=/root/.kube/config

if [ -f ${KUBECONFIG} ]; then
   echo "Using externally mounted Kubeconfig file..."
else
   echo "Kubeconfig not found, configuring using env vars..."

    mkdir -p /root/.kube/
    sh -c "cat > ${KUBECONFIG}" <<EOF
apiVersion: v1
clusters:
- cluster:
    certificate-authority-data: ${CA_DATA}
    server: ${MASTER_HOST}
  name: default-cluster
contexts:
- context:
    cluster: default-cluster
    user: default-user
  name: default-user
current-context: default-user
kind: Config
preferences: {}
users:
- name: default-user
  user:
    client-certificate-data: ${CLIENT_DATA}
    client-key-data: ${CLIENT_KEY}
EOF

fi

# run sh as entrypoint
exec /bin/sh -c "$@"