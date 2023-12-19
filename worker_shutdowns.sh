
log(){
  dt=$(date)
  echo --${0##*/}-$dt: ${@}
}



# no access to shutdown vm from azure; so disable kubelet and then reboot (this ensures all containers and kubelet down) 
disable_node() {
  node=$1 
  log "shutting down ${node}"
  ssh -tq azureuser@${node} sh -c "'sudo systemctl disable kubelet ; sudo shutdown -r now'"
  kubectl wait --for=condition=NotReady node/${node}
  log "${node} is down"
}

enable_node() {
  node=$1
  ssh -tq azureuser@${node} sh -c "'sudo systemctl enable kubelet; sudo systemctl start kubelet'"
  kubectl wait --for=condition=Ready node/${node}
  log "${node} is ready"
}

workers=( $(kubectl get nodes  | grep pool | awk '{print $1}' | grep -v udr1-rdmwa45-naks-1-28eae184-agentpool1-md-lxr7z )  )

while true; do
   # pick 2 random workers
   worker1=${workers[ $(echo ${RANDOM} % ${#workers[@]} | bc) ]}
   worker2=${workers[ $(echo ${RANDOM} % ${#workers[@]} | bc) ]}   
   log "selected ${worker1} and ${worker2}"
   disable_node ${worker1}
#   disable_node ${worker2}
   log sleeping
   sleep 150
   enable_node ${worker1}
#   enable_node ${worker2} 
   log sleeping
   sleep 150
done
