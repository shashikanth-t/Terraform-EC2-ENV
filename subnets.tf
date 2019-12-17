resource "aws_subnet" "PublicAZA" {
  vpc_id     = "${aws_vpc.mainvpc.id}"
  cidr_block = "${var.Subnet-Public-AzA-CIDR}"

  tags = {
    Name = "2a-PublicSubnet"
  }

  availability_zone = "${data.aws_availability_zones.available.names[0]}"
}

resource "aws_subnet" "PrivateAZA" {
  vpc_id     = "${aws_vpc.mainvpc.id}"
  cidr_block = "${var.Subnet-Private-AzA-CIDR}"

  tags = {
    Name = "2a-PrivateSubnet"
  }

  availability_zone = "${data.aws_availability_zones.available.names[1]}"
}

resource "aws_subnet" "PublicAZB" {
  vpc_id     = "${aws_vpc.mainvpc.id}"
  cidr_block = "${var.Subnet-Public-AzB-CIDR}"

  tags = {
    Name = "2b-PublicSubnet"
  }

  availability_zone = "${data.aws_availability_zones.available.names[0]}"
}
resource "aws_subnet" "PrivateAZB" {
  vpc_id     = "${aws_vpc.mainvpc.id}"
  cidr_block = "${var.Subnet-Private-AzB-CIDR}"

  tags = {
    Name = "2b-PrivateSubnet"
  }

  availability_zone = "${data.aws_availability_zones.available.names[1]}"
}

#subnet-route table association

resource "aws_route_table_association" "PublicAZA" {
  subnet_id      = "${aws_subnet.PublicAZA.id}"
  route_table_id = "${aws_route_table.public.id}"
}

resource "aws_route_table_association" "PrivateAZA" {
  subnet_id      = "${aws_subnet.PrivateAZA.id}"
  route_table_id = "${aws_route_table.private.id}"
}

resource "aws_route_table_association" "PublicAZB" {
  subnet_id      = "${aws_subnet.PublicAZB.id}"
  route_table_id = "${aws_route_table.public.id}"
}

resource "aws_route_table_association" "PrivateAZB" {
  subnet_id      = "${aws_subnet.PrivateAZB.id}"
  route_table_id = "${aws_route_table.private.id}"
}
