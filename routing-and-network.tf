# Declare the data source
data "aws_availability_zones" "available" {}
/* EXTERNAL NETWORG , IG, ROUTE TABLE */
#internet gateway declaration
resource "aws_internet_gateway" "gw" {
  vpc_id = "${aws_vpc.mainvpc.id}"

  tags = {
    Name = "IGW-MainVPC-Ohio"
  }
}
resource "aws_route_table" "public" {
  vpc_id = "${aws_vpc.mainvpc.id}"

  tags = {
    Name = "Public"
  }

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_internet_gateway.gw.id}"
  }
}

resource "aws_route_table" "private" {
  vpc_id = "${aws_vpc.mainvpc.id}"

  tags = {
    Name = "Private"
  }
#natgateway declaration
  #  route {
  #    cidr_block     = "0.0.0.0/0"
  #    nat_gateway_id = "${aws_nat_gateway.PublicAZA.id}"
  #  }
}

#resource "aws_eip" "forNat" {
#  vpc = true
#}


#resource "aws_nat_gateway" "PublicAZA" {
#allocation_id = "${aws_eip.forNat.id}"
#subnet_id     = "${aws_subnet.PublicAZA.id}"
#depends_on    = ["aws_internet_gateway.gw"]
#}
