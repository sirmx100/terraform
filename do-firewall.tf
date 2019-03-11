resource "digitalocean_firewall" "http-c2" {
name = "http-c2"
droplet_ids = ["${digitalocean_droplet.http-c2.id}"]
inbound_rule = [
{
protocol = "tcp"
port_range = "22"
source_addresses = ["${var.attacker-ip}"]
},
{
protocol = "tcp"
port_range = "80"
source_addresses = ["0.0.0.0/0"]
},
{
protocol = "tcp"
port_range = "443"
source_addresses = ["0.0.0.0/0"]
},
{
protocol = "tcp"
port_range = "50050"
source_addresses = ["${var.attacker-ip}"]
}
]outbound_rule = [
{
protocol = "udp"
port_range = "53"
destination_addresses = ["0.0.0.0/0"]
},
{
protocol = "tcp"
port_range = "80"
destination_addresses = ["0.0.0.0/0"]
},
{
protocol = "tcp"
port_range = "443"
destination_addresses = ["0.0.0.0/0"]
}
]
}
resource "digitalocean_firewall" "c2-dns" {
name = "c2-dns"
droplet_ids = ["${digitalocean_droplet.dns-c2.id}"]
inbound_rule = [
{
protocol = "tcp"port_range = "22"
source_addresses = ["${var.attacker-ip}"]
},
{
protocol = "udp"
port_range = "53"
source_addresses = ["${aws_instance.dns-rdir.public_ip}"]
},
{
protocol = "tcp"
port_range = "50050"
source_addresses = ["${var.attacker-ip}"]
}
]
outbound_rule = [
{
protocol = "udp"
port_range = "53"
destination_addresses = ["0.0.0.0/0"]
},
{
protocol = "tcp"
port_range = "80"
destination_addresses = ["0.0.0.0/0"]
},
{
protocol = "tcp"port_range = "443"
destination_addresses = ["0.0.0.0/0"]
}
]
}
resource "digitalocean_firewall" "paydel" {
name = "paydel"
droplet_ids = ["${digitalocean_droplet.paydel.id}"]
inbound_rule = [
{
protocol = "tcp"
port_range = "22"
source_addresses = ["${var.attacker-ip}"]
},
{
protocol = "tcp"
port_range = "80"
source_addresses = ["${aws_instance.http-rdir.public_ip}"]
},
{
protocol = "tcp"
port_range = "443"
source_addresses = ["${aws_instance.http-rdir.public_ip}"]
},
{protocol = "tcp"
port_range = "50050"
source_addresses = ["${var.attacker-ip}"]
}
]
outbound_rule = [
{
protocol = "udp"
port_range = "53"
destination_addresses = ["0.0.0.0/0"]
},
{
protocol = "tcp"
port_range = "80"
destination_addresses = ["0.0.0.0/0"]
},
{
protocol = "tcp"
port_range = "443"
destination_addresses = ["0.0.0.0/0"]
}
]
}
