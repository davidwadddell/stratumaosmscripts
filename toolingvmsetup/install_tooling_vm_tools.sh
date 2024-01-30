set -e
sudo tar Cxzvf /usr/local containerd-1.7.7-linux-amd64.tar.gz
sudo install -m 755 runc.amd64 /usr/local/sbin/runc
sudo mkdir -p /opt/cni/bin
sudo tar Cxzvf /opt/cni/bin cni-plugins-linux-amd64-v1.1.1.tgz
sudo mkdir /etc/containerd
containerd config default | sudo tee /etc/containerd/config.toml
sudo sed -i 's/SystemdCgroup \= false/SystemdCgroup \= true/g' /etc/containerd/config.toml
mv containerd.service  /etc/systemd/system/.
sudo systemctl daemon-reload
systemctl start containerd
sleep 2
sudo systemctl status containerd
ctr images
sudo tar Cxzvvf /usr/local nerdctl-full-1.7.2-linux-amd64.tar.gz
