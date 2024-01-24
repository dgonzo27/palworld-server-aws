resource "aws_key_pair" "palworld-keypair" {
  key_name   = var.keypair_name
  public_key = file(var.keypair_file)
}
