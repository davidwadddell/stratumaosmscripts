for pod in $(kubectl get pods -l app=stratum -o name); do ./test_kill_pod.sh ${pod} sleep 60; done
