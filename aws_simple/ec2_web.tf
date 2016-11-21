
resource "aws_instance" "web1" {
  depends_on = ["aws_iam_instance_profile.ec2base_profile"]

  ami = "${var.ami}"
  instance_type = "t2.micro"
  subnet_id = "${aws_subnet.subnet-aza.id}"
  associate_public_ip_address = true
  vpc_security_group_ids = ["${aws_security_group.websg.id}"]

  key_name = "ec2testkey" # Currently this resource only supports importing an existing key pair.
  iam_instance_profile = "ec2base_profile"
  user_data = "${file("ec2_web_shells/web_ebs_mount.sh")}"

  root_block_device = {
    volume_type = "gp2"
    volume_size = "8"
    delete_on_termination = "true" // EBSの消し忘れ防止のためtrue(料金がかかる)
  }
  ebs_block_device = {
    device_name = "/dev/sdf"
    volume_type = "gp2"
    volume_size = "8"
    delete_on_termination = "true" // EBSの消し忘れ防止のためtrue(料金がかかる)
  }

  provisioner "file" {
    source = "ec2_web_shells/awslogs/awslogs.conf"
    destination = "/home/centos/awslogs.conf"
    connection { type = "ssh" user = "centos" private_key = "${file("keys/ec2testkey.pem")}" }
  }
  provisioner "file" {
    source = "ec2_web_shells/base_provisioning.sh"
    destination = "/home/centos/base_provisioning.sh"
    connection { type = "ssh" user = "centos" private_key = "${file("keys/ec2testkey.pem")}" }
  }
  provisioner "remote-exec"  {
    inline = [
      "chmod +x /home/centos/base_provisioning.sh",
      "source /home/centos/base_provisioning.sh"
    ]
    connection { type = "ssh" user = "centos" private_key = "${file("keys/ec2testkey.pem")}" }
  }
}
