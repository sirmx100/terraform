output "dns-rdir-ip" {
value = "${aws_instance.dns-rdir.public_ip}"
}
output "http-rdir-ip" {
value = "${aws_instance.http-rdir.public_ip}"
}
output "paydel-ip" {
value = "${digitalocean_droplet.paydel.ipv4_address}"
}
output "http-c2-ip" {value = "${digitalocean_droplet.http-c2.ipv4_address}"
}
output "dns-c2-ip" {
value = "${digitalocean_droplet.dns-c2.ipv4_address}"
}
output "cf-domain" {
value = "${aws_cloudfront_distribution.http-c2.domain_name}"
}
