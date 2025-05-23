# Install dependencies for Terramino demo app

# Update package list
apt-get update

# Install required packages
apt-get install -y ca-certificates curl gnupg git

# Add Docker's official GPG key
install -m 0755 -d /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | gpg --dearmor -o /etc/apt/keyrings/docker.gpg
chmod a+r /etc/apt/keyrings/docker.gpg

# Add Docker repository
echo \
  "deb [arch="$(dpkg --print-architecture)" signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  "$(. /etc/os-release && echo "$VERSION_CODENAME")" stable" | \
  tee /etc/apt/sources.list.d/docker.list > /dev/null

# Install Docker packages
apt-get update
apt-get install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

# Add vagrant user to docker group
usermod -aG docker vagrant


# ----------------------
# Python Installation
# ----------------------
apt-get install -y python3 python3-pip python3-venv

# ----------------------
# Nginx Installation
# ----------------------
apt-get install -y nginx

# Enable and start Nginx
systemctl enable nginx
systemctl start nginx


# ----------------------
# k3s
# ----------------------
curl -sfL https://get.k3s.io | sh -

# rendre kubectl executable pour le user vagrant
mkdir -p /home/vagrant/.kube
cp /etc/rancher/k3s/k3s.yaml /home/vagrant/.kube/config
chown -R vagrant:vagrant /home/vagrant/.kube