

resource "tls_private_key" "cloud_base" {
  algorithm = "RSA"
  rsa_bits  = 4096
}



resource "local_file" "private_key_pem" {
  filename = "${path.module}/my-key-pair.pem"  
  content  = tls_private_key.cloud_base.private_key_pem
}



resource "local_file" "public_key" {
  filename = "${path.module}/my-key-pair.pub"
  content  = tls_private_key.cloud_base.public_key_openssh
}



resource "aws_key_pair" "key_pair" {
  key_name   = "cloud_base"
  public_key = tls_private_key.cloud_base.public_key_openssh
}


resource "aws_instance" "Cloud-Base" {
  ami           = "ami-0fa40e25bf4dda1f6"  
  instance_type = "t2.micro"  
  key_name      = aws_key_pair.key_pair.key_name  

  tags = {
    Name = "Cloud-Base"
  }
}


resource "aws_s3_bucket" "cloud_base_bucket" {
  bucket = "cloud-base-bucket"  
  acl    = "private"                     
}

