resource "aws_instance" "EC2-1" {
  ami           = var.ami-Practice1
  instance_type = var.instance_type
  availability_zone = var.availability_zone-Practice1
  #user_data = file("./IIS_installation-1.ps1")
  #user_data = file("${path.module}/IIS_installation-1.ps1")
  /*user_data = <<EOF
               <powershell>
               Install-WindowsFeature -name Web-Server -IncludeManagementTools
               New-Item -Path C:\inetpub\wwwroot\index.html -ItemType File -Value "RESPONSE FROM SERVER 1" -Force
               </powershell>
               EOF*/
  key_name               = var.key_name
  vpc_security_group_ids = [aws_security_group.SG-1.id]
  #vpc_security_group_ids = data.terraform_remote_state.aws_vpc.VPC_ID
  subnet_id              = aws_subnet.public-subnet-1.id
  tags = {
    Name  = "1"
    
  }
}

resource "aws_instance" "EC2-2" {
  ami           = var.ami-Practice2
  instance_type = var.instance_type
  availability_zone = var.availability_zone-Practice2
  #user_data = file("./IIS_installation-2.ps1")
  #user_data = file("${path.module}/IIS_installation-2.ps1")

  /*user_data = <<EOF
               <powershell>
               Install-WindowsFeature -name Web-Server -IncludeManagementTools
               New-Item -Path C:\inetpub\wwwroot\index.html -ItemType File -Value "RESPONSE FROM SERVER 2" -Force
               </powershell>
               EOF*/
  key_name               = var.key_name
  vpc_security_group_ids = [aws_security_group.SG-2.id]
  subnet_id              = aws_subnet.public-subnet-2.id
  tags = {
    Name  = "2"
    
  }
}



