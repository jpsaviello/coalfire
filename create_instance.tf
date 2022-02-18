resource "aws_volume_attachment" "ebs_att" {
  device_name = "/dev/sdh"
  volume_id   = aws_ebs_volume.example.id
  instance_id = aws_instance.redhat.id
}

//Went with the AWS Linux AMI and installed an EBS volume for storage
resource "aws_instance" "redhat" {
  ami               = "ami-0ff8a91507f77f867"
  subnet_id         = "subnet-00cf0b2454e91e764"
  availability_zone = "us-east-1b"
  instance_type     = "t2.micro"

  tags = {
    Name = "Linux Instance"
  }
}

resource "aws_ebs_volume" "example" {
  availability_zone = "us-east-1b"
  size              = 20
}