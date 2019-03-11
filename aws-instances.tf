resource "aws_instance" "dns-rdir" {
    ami = "ami-489f8e2c" # Amazon Linux AMI 2017.03.1
    instance_type = "t2.micro"
    key_name = "${aws_key_pair.rasta.key_name}"
    vpc_security_group_ids = ["${aws_security_group.dns-rdir.id}"]
    subnet_id = "${aws_subnet.default.id}"
    associate_public_ip_address = true
}
resource "aws_instance" "http-rdir" {
    ami = "ami-489f8e2c" # Amazon Linux AMI 2017.03.1
    instance_type = "t2.micro"
    key_name = "${aws_key_pair.rasta.key_name}"
    vpc_security_group_ids = ["${aws_security_group.http-rdir.id}"]
    subnet_id = "${aws_subnet.default.id}"
    associate_public_ip_address = true
}
