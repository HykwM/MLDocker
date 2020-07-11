#!/bin/bash
set -Ceu

echo "dockerをインストールします。参考：https://docs.docker.com/install/linux/docker-ce/debian/"
curl -sSL https://get.docker.com/ | CHANNEL=stable sh



echo "docker-composeをインストールします。参考：https://docs.docker.com/compose/install/"
sudo curl -L "https://github.com/docker/compose/releases/download/1.25.4/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose



echo "nvidia-container-toolkitおよびnvidia-container-runtimeをインストールします。
	参考：https://github.com/NVIDIA/nvidia-container-runtime
	      https://github.com/NVIDIA/nvidia-docker"

distribution=$(. /etc/os-release;echo $ID$VERSION_ID)
curl -s -L https://nvidia.github.io/nvidia-docker/gpgkey | sudo apt-key add -
curl -s -L https://nvidia.github.io/nvidia-container-runtime/gpgkey | sudo apt-key add -
curl -s -L https://nvidia.github.io/nvidia-container-runtime/$distribution/nvidia-container-runtime.list | sudo tee /etc/apt/sources.list.d/nvidia-container-runtime.list

sudo apt-get update && sudo apt-get install -y nvidia-container-toolkit nvidia-container-runtime

sudo tee /etc/docker/daemon.json <<EOF
{
    "runtimes": {
        "nvidia": {
            "path": "/usr/bin/nvidia-container-runtime",
            "runtimeArgs": []
        }
    }
}
EOF
sudo pkill -SIGHUP dockerd
sudo usermod -aG docker $USER

echo "インストール作業が完了しました。再起動してください。"