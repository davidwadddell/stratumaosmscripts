 while true ; do kubectl get pods -A 2>&1 > /dev/null; status=$?; echo "$(date) : status : ${status}"; sleep 5; done
