# Outputs.tf
output "instance_id" {
  description = " Instance ID of the instance"
  value       = aws_instance.nginx-webserver.id
}

output "instance_IP" {
  description = " Public IP of the instance"
  value       = aws_instance.nginx-webserver.public_ip
}

output "nginx-webserver_eip" {
  description = " Public IP of the instance"
  value       = aws_eip.nginx-eip.public_ip
}
