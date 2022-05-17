resource "aws_instance" "EC2-1" {
  ami           = var.ami-Practice1
  instance_type = var.instance_type
  iam_role = var.aws_iam_role
  availability_zone = var.availability_zone-Practice1
  key_name               = var.key_name
  vpc_security_group_ids = [aws_security_group.SG-1.id]
  subnet_id              = aws_subnet.public-subnet-1.id
  tags = {
    Name  = "1"
    
  }
}



