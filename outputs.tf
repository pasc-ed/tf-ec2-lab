output "ansible_servers_ip" {
    value = aws_eip.ansible_server_ip[*].public_ip
}