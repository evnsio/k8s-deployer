#!/bin/sh

mkdir -p /root/.kube/

sh -c "cat > /root/.kube/config" <<EOF
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

# run sh as entrypoint
exec /bin/sh -c "$@"