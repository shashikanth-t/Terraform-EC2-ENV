resource "aws_instance" "webapp1" {
  ami                         = "${var.ami}"
  instance_type               = "t2.micro"
  associate_public_ip_address = "true"
  subnet_id                   = "${aws_subnet.PublicAZA.id}"
  vpc_security_group_ids      = ["${aws_security_group.WebServer.id}"]
  key_name                    = "${var.key_name}"

  tags = {
    Name = "WebApp1"
  }

  user_data = "${file("app-userdata.sh")}"
}
resource "aws_instance" "webapp2" {
  ami                         = "${var.ami}"
  instance_type               = "t2.micro"
  associate_public_ip_address = "true"
  subnet_id                   = "${aws_subnet.PublicAZB.id}"
  vpc_security_group_ids      = ["${aws_security_group.WebServer.id}"]
  key_name                    = "${var.key_name}"

  tags = {
    Name = "WebApp2"
  }

  user_data = "${file("app-userdata.sh")}"
}
