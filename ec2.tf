resource "aws_instance" "ansible_servers" {
  count = 1

  ami           = data.aws_ami.ubuntu.id
  instance_type = "t3.medium"

  vpc_security_group_ids = [aws_security_group.ansible_server.id]
  key_name = "talent-academy-lab"
  subnet_id = data.aws_subnet.public.id

  tags = {
    Name = "Ansible Server ${count.index + 1}"
  }
}

resource "aws_eip" "ansible_server_ip" {
  count = 1

  instance = aws_instance.ansible_servers[count.index].id
  vpc      = true
}
