
resource "aws_subnet" "subnet-aza" {
  availability_zone = "${var.aza}"
  vpc_id = "${aws_vpc.main.id}"
  cidr_block = "10.1.11.0/24"
  map_public_ip_on_launch = true
}
resource "aws_subnet" "subnet-azc" {
  availability_zone = "${var.azc}"
  vpc_id = "${aws_vpc.main.id}"
  cidr_block = "10.1.31.0/24"
  map_public_ip_on_launch = true
}
