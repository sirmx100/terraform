resource "digitalocean_droplet" "http-c2" {
    image = "ubuntu-14-04-x64"
    name = "http-c2"
    region = "lon1"
    size = "2gb"
    ssh_keys = ["${digitalocean_ssh_key.rasta.id}"]
}
resource "digitalocean_droplet" "dns-c2" {
    image = "ubuntu-14-04-x64"
    name = "dns-c2"
    region = "lon1"
    size = "2gb"
    ssh_keys = ["${digitalocean_ssh_key.rasta.id}"]
}
resource "digitalocean_droplet" "paydel" {
    image = "ubuntu-14-04-x64"
    name = "payload-delivery"
    region = "lon1"
    size = "512mb"
    ssh_keys = ["${digitalocean_ssh_key.rasta.id}"]
}
