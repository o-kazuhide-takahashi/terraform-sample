## simple VPC
resource "aws_vpc" "main" {
  cidr_block = "10.1.0.0/16"
  enable_dns_support = true
  enable_dns_hostnames = true
  tags {
    Name = "vpc-main"
  }
}
## internet access
resource "aws_internet_gateway" "mainigw" {
  vpc_id = "${aws_vpc.main.id}"
}
resource "aws_route_table" "mainigw-rt" {
  vpc_id = "${aws_vpc.main.id}"
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_internet_gateway.mainigw.id}"
  }
}
resource "aws_main_route_table_association" "mainigw-rta" {
  vpc_id = "${aws_vpc.main.id}"
  route_table_id = "${aws_route_table.mainigw-rt.id}"
}
