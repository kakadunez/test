terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 3.0.0"
    }
  }
}

provider "docker" {}

# 1. 🌐 GIẢ LẬP HẠ TẦNG MẠNG AWS
resource "docker_network" "aws_vpc" {
  name = "aws-virtual-private-cloud"
}

# 2. 🌐 GIẢ LẬP HẠ TẦNG MẠNG GCP
resource "docker_network" "gcp_vpc" {
  name = "gcp-virtual-private-cloud"
}

# 3. 💻 MÁY CHỦ ẢO TRÊN VÙNG AWS (Giả lập EC2 Instance)
resource "docker_container" "aws_server" {
  name  = "aws-ec2-instance"
  image = "nginx:alpine" # Sử dụng Nginx siêu nhẹ làm đại diện máy chủ
  networks_advanced {
    name = docker_network.aws_vpc.name
  }
}

# 4. 💻 MÁY CHỦ ẢO TRÊN VÙNG GCP (Giả lập Cloud Compute Engine)
resource "docker_container" "gcp_server" {
  name  = "gcp-compute-engine"
  image = "nginx:alpine"
  networks_advanced {
    name = docker_network.gcp_vpc.name
  }
}

