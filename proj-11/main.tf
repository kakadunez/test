provider "aws" {
  region                      = "us-east-1"
  access_key                  = "mockadmin"
  secret_key                  = "mocksecret"
  skip_credentials_validation = true
  skip_metadata_api_check     = true
  skip_requesting_account_id  = true

  endpoints {
    ec2 = "http://localhost:4566"
    iam = "http://localhost:4566"
  }
}

# 1. Network Layer (VPC)
resource "aws_vpc" "project_11_vpc" {
  cidr_block           = "10.0.0.0/16"
  enable_dns_hostnames = true
  tags = { Name = "project-11-vpc" }
}

# 2. Public Subnet
resource "aws_subnet" "public_subnet" {
  vpc_id            = aws_vpc.project_11_vpc.id
  cidr_block        = "10.0.1.0/24"
  availability_zone = "us-east-1a"
  tags = { Name = "project-11-public-subnet" }
}

# 3. TIER 1: Web Server (EC2 Instance)
resource "aws_instance" "web_server" {
  ami           = "ami-df5de72f" 
  instance_type = "t2.micro"
  subnet_id     = aws_subnet.public_subnet.id
  tags = { Name = "Project-11-Web-Server" }
}

