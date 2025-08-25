# This is Output
/*
output "ec2_public_ip" {
    value = aws_instance.my_instance.public_ip
    }

output "ec2_public_dns" {
    value = aws_instance.my_instance.public_dns
}

output "ec2_private_ip" {
    value = aws_instance.my_instance.private_ip  
}
*/

# This is for for_each

output "ec2_public_ip" {
  value = { for k, instance in aws_instance.my_instance 
  : k => instance.public_ip }
}

output "ec2_private_ip" {
  value = { for k, instance in aws_instance.my_instance 
  : k => instance.private_ip }
}

output "ec2_public_dns" {
  value = { for k, instance in aws_instance.my_instance 
  : k => instance.public_dns }
}

