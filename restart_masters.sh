
masters=$( grep control /etc/hosts | awk '{print $2}')

for master in ${masters} ; do
	  echo "shutting down ${master}"
	  ssh -tq azureuser@${master} sudo shutdown -r now
	  kubectl wait --for=condition=NotReady node/${master}
	  kubectl wait --for=condition=Ready node/${master}
	  echo "${master} is ready again"
	  sleep 60
	  kubectl get pods
done	  
