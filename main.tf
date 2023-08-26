terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
    }
      backend "s3" {
    bucket = "sctp-ce3-tfstate-bucket"
    key    = "stef1.tfstate"
    region = "us-east-1"
  }
  



}

provider "aws" {
  region = "us-east-1"
}

resource "aws_s3_bucket" "bucket" {
  bucket = "stefbucket21aug"

  tags = {
    Name = "stef bucket"
  }
}

resource "aws_instance" "instances" {
  ami           = "ami-08a52ddb321b32a8c"  # Amazon Linux 2 LTS
  instance_type = "t2.micro"
  count         = 2

  tags = {
    Name = "stef bucket ${count.index + 1}"
  }
}