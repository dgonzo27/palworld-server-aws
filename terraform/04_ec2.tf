resource "aws_instance" "palworld-server" {
  ami                         = data.aws_ami.debian-ami.id
  instance_type               = "t3.xlarge"
  subnet_id                   = data.aws_subnet.public-subnet.id
  security_groups             = [aws_security_group.security-group.id]
  key_name                    = aws_key_pair.palworld-keypair.key_name
  associate_public_ip_address = true
}
