set -e
wget https://github.com/containerd/containerd/releases/download/v1.7.7/containerd-1.7.7-linux-amd64.tar.gz
wget https://github.com/opencontainers/runc/releases/download/v1.1.3/runc.amd64
wget https://github.com/containernetworking/plugins/releases/download/v1.1.1/cni-plugins-linux-amd64-v1.1.1.tgz
wget https://raw.githubusercontent.com/containerd/containerd/main/containerd.service
wget https://github.com/jqlang/jq/releases/download/jq-1.7.1/jq-1.7.1.tar.gz 
wget https://dl.k8s.io/release/v1.28.3/bin/linux/amd64/kubectl
wget https://github.com/containerd/nerdctl/releases/download/v1.7.2/nerdctl-1.7.2-linux-amd64.tar.gz
for f in containerd-1.7.7-linux-amd64.tar.gz runc.amd64 cni-plugins-linux-amd64-v1.1.1.tgz containerd.service jq-1.7.1.tar.gz  kubectl nerdctl-1.7.2-linux-amd64.tar.gz ; do
	scp ${f} tooling-vm:.
done
