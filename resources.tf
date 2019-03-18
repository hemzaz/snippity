# Define SSH key pair for our instances
resource "aws_key_pair" "default" {
  key_name = "mumbai"
  public_key = "${file("${var.key_path}")}"
}

# Define webserver inside the public subnet
resource "aws_instance" "micro" {
   ami  = "${var.ami}"
   count = 3
   instance_type = "t2.micro"
   key_name = "${aws_key_pair.default.id}"
   subnet_id = "${aws_subnet.private-subnet.id}"
   vpc_security_group_ids = ["${aws_security_group.sgpriv.id}"]
   source_dest_check = false

  tags {
    Name = "micro-${count.index}"
  }
}