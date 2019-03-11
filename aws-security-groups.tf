resource "aws_security_group" "dns-rdir" {
    name = "dns-redirector"
    vpc_id = "${aws_vpc.default.id}"
    ingress {
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = ["${var.attacker-ip}"]
}
    ingress {
        from_port = 53
        to_port = 53protocol = "udp"
        cidr_blocks = ["0.0.0.0/0"]
}
    egress {
        from_port = 53
        to_port = 53
        protocol = "udp"
        cidr_blocks = ["0.0.0.0/0"]
}
    egress {
        from_port = 80
        to_port = 80
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
}
    egress {
        from_port = 443
        to_port = 443
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
}
resource "aws_security_group" "http-rdir" {
    name = "http-redirector"
    vpc_id = "${aws_vpc.default.id}"
    ingress {
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = ["${var.attacker-ip}"]
}
    ingress {
        from_port = 80
        to_port = 80
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
}
    ingress {
        from_port = 443
        to_port = 443
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
}
    egress {
        from_port = 53
        to_port = 53
        protocol = "udp"
        cidr_blocks = ["0.0.0.0/0"]
}
    egress {
        from_port = 80
        to_port = 80protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
}
    egress {
        from_port = 443
        to_port = 443
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
}
