resource "aws_vpc" "my_vpc" {
  cidr_block           = "10.123.0.0/16"
  enable_dns_hostnames = true
  enable_dns_support   = true
  tags = { Name = "cloud" }
}

resource "aws_subnet" "my_public_subnet" {
  vpc_id                  = aws_vpc.my_vpc.id
  cidr_block              = "10.123.1.0/24"
  map_public_ip_on_launch = true
  availability_zone       = "us-west-2b"
  tags = { Name = "cloud-public" }
}

resource "aws_internet_gateway" "my_internet_gateway" {
  vpc_id = aws_vpc.my_vpc.id
  tags   = { Name = "cloud-igw" }
}

resource "aws_route_table" "my_public_route" {
  vpc_id = aws_vpc.my_vpc.id
  tags   = { Name = "cloud-public_route" }
}

resource "aws_route" "default_route" {
  route_table_id         = aws_route_table.my_public_route.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.my_internet_gateway.id
}

resource "aws_route_table_association" "my_public_association" {
  subnet_id      = aws_subnet.my_public_subnet.id
  route_table_id = aws_route_table.my_public_route.id
}

resource "aws_security_group" "allow_ssh" {
  name        = "allow_ssh"
  description = "Allow SSH access"

  ingress {
    description = "SSH access"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] 
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1" 
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "allow_ssh"
  }
}

resource "aws_network_acl" "ssh_acl" {
  vpc_id = aws_vpc.my_vpc.id
  
  ingress {
    protocol   = "6" 
    rule_no    = 100
    action     = "allow"
    cidr_block = "0.0.0.0/0" 
    from_port  = 22
    to_port    = 22
  }

  egress {
    protocol   = "-1" 
    rule_no    = 100
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 0
    to_port    = 0
  }

  tags = { Name = "ssh_acl" }
}

resource "aws_network_acl_association" "my_public_subnet_association" {
  subnet_id      = aws_subnet.my_public_subnet.id
  network_acl_id = aws_network_acl.ssh_acl.id
}
