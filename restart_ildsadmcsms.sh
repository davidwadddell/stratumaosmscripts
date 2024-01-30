kubectl exec -ti $(kubectl get pods -o name | grep ems01) -- /opt/opwv/oam/4.1/bin/OamCommandLine -u rest -p restpass -s 'SdmceSystem' -h localhost -c 'restart site1region1/*/ADMElement'
kubectl exec -ti $(kubectl get pods -o name | grep ems01) -- /opt/opwv/oam/4.1/bin/OamCommandLine -u rest -p restpass -s 'SdmceSystem' -h localhost -c 'restart site1region1/*/CSMElement'
kubectl exec -ti $(kubectl get pods -o name | grep ems01) -- /opt/opwv/oam/4.1/bin/OamCommandLine -u rest -p restpass -s 'SdmceSystem' -h localhost -c 'restart site1region1/*/ILDElement'
