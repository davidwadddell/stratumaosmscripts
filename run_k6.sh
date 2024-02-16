set -x
nerdctl  run -it \
   --sysctl net.ipv4.ip_local_port_range="15000    60999"    \
   --sysctl net.ipv4.tcp_fin_timeout=30                      \
   --sysctl net.ipv4.tcp_tw_reuse=1                          \
   --rm                                                      \
   --name k6                                                 \
   --entrypoint /bin/sleep stratum.owmobility.com/stratumcnf/enea-k6:latest infinity
