# list pods according to the topology.kubernetes.io/zone label. 
# script is lazy in calling kubetctl too many times, could call once for nodes and once for pods and merge. 
zones=$(kubectl get nodes  -o json | jq -r '.items[].metadata.labels."topology.kubernetes.io/zone"' | sort | uniq)
for z in ${zones}; do
   echo zone"${z}":
   echo "=======" 
   nodes=$(kubectl get nodes -l topology.kubernetes.io/zone=${z} -o json | jq -r '.items[].metadata.name'); 
   for n in ${nodes}; do
      kubectl get pods -o wide | grep ${n}
   done;
done 
