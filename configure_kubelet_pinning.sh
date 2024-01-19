#!/bin/bash
set -e

cat >> /var/lib/kubelet/config.yaml << EOF
cpuManagerPolicy: static
reservedSystemCPUs: 0-1
EOF
systemctl stop kubelet
rm -rf /var/lib/kubelet/cpu_manager_state
systemctl start kubelet
