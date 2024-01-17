#!/bin/bash
pod_proc_running() {
   kubectl exec -q $1 -- pgrep $2 2>&1 > /dev/null
}

kill_pod_proc() {
   kubectl exec -q $1 -- pkill -9 $2  > /dev/null
}

kill_and_wait() {

  pod=$1
  proc=$2
  echo "---------------------------------"
  echo "testing kill of ${proc} in ${pod}"
  if pod_proc_running ${pod} ${proc} ; then
     echo "${proc} is running in ${pod}"
  else
     echo "${proc} is not running in ${pod}"
  fi

  kill_pod_proc $pod ${proc}
  while ! pod_proc_running ${pod} ${proc}; do
    dt=$(date)
    echo "$(date) - waiting for ${proc} in ${pod}"
    sleep 5
  done
  echo "$(date) - ${proc} is running in ${pod}"
}

csms=$(kubectl get pods -o name -l name=csm)
adms=$(kubectl get pods -o name -l name=adm)
ilds=$(kubectl get pods -o name -l name=ild)

for csm in ${csms}; do
  kill_and_wait ${csm} csm_manager
  kill_and_wait ${csm} netdata
done

for adm in ${adms}; do
  kill_and_wait ${adm} adm_manager
  kill_and_wait ${adm} netdata
done

for ild in ${ilds}; do
  kill_and_wait ${ild} ild_manager
  kill_and_wait ${ild} netdata
done

