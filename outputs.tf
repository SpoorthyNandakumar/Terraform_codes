

output "instance_1_ID" {
  description = "ID of the EC2 instance"
  value       = "${aws_instance.EC2-1.id}"
}




output "publicip_instance__1" {
  description = "EC2 Instance Public IP"
  value = aws_instance.EC2-1.public_ip
}


