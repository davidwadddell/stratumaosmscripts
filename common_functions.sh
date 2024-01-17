
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

