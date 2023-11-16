kubectl exec -ti $(kubectl get pods | grep ems01 | awk '{print $1}' ) -- /opt/opwv/oam/4.1/grafana/bin/grafana-cli --homepath /opt/opwv/oam/4.1/grafana  admin reset-admin-password "admin"
