nerdctl exec -ti k6 sh -c " cd /var/tmp/stratum/ && k6 run provisioning.js --no-color --no-summary --no-thresholds --log-output file=provision.log"
