resource "cloudflare_record" "http-rdir1" {domain = "${var.dom1}"
name = "${var.sub1}"
value = "${aws_instance.http-rdir.public_ip}"
type = "A"
ttl = 300
}
resource "cloudflare_record" "http-rdir2" {
domain = "${var.dom1}"
name = "${var.sub2}"
value = "${aws_instance.http-rdir.public_ip}"
type = "A"
ttl = 300
}
resource "cloudflare_record" "http-df" {
domain = "${var.dom1}"
name = "${var.sub3}"
value = "${digitalocean_droplet.http-c2.ipv4_address}"
type = "A"
ttl = 300
}
resource "cloudflare_record" "dns-c2-ns1" {
domain = "${var.dom2}"
name = "ns1"
value = "${aws_instance.dns-rdir.public_ip}"
type = "A"ttl
= 300
}
resource "cloudflare_record" "dns-c2-a" {
domain = "${var.dom2}"
name = "${var.sub4}"
value = "ns1.${var.dom2}"
type = "NS"
ttl = 300
}
