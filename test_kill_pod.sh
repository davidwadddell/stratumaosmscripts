pod=$1
date
echo "force killing ${pod}"
kubectl delete ${pod} --force --grace-period=0
echo "waiting for ${pod} to be ready"
time -p kubectl wait ${pod} --timeout=300s --for=condition=Ready
