
set -e
ILD_IP=$(kubectl get svc site1-enea-ild-0 -o json | jq -r .status.loadBalancer.ingress[].ip)
sed s#__SITE1_ILD_IP__#${ILD_IP}#g properties.env.sh.tmpl > properties.env.sh
kubectl cp properties.env.sh site1-stratum-pytest-client-0:/opt/opwv/sdmCD/4.1/tests/properties.env.sh



if [ "$1" == "init" ] ; then
   kubectl cp run_init.sh site1-stratum-pytest-client-0:/tmp/run_init.sh
   kubectl exec   site1-stratum-pytest-client-0 -- /tmp/run_init.sh
fi

if [ "$1" == "smoke" ] ; then
   kubectl cp run_smoke.sh site1-stratum-pytest-client-0:/tmp/run_smoke.sh
   kubectl exec   site1-stratum-pytest-client-0 -- /tmp/run_smoke.sh	
fi
