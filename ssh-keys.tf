resource "aws_key_pair" "rasta" {
    key_name = "rasta"
    public_key = "${file("${var.rasta-key}")}"
}
resource "digitalocean_ssh_key" "rasta" {
    name = "rasta"
    public_key = "${file("${var.rasta-key}")}"
}
