provider "aws" {
    access_key = "${var.aws-akey}"
    secret_key = "${var.aws-skey}"
    region = "eu-west-2"
}
provider "digitalocean" {
    token = "${var.do-token}"
}
provider "cloudflare" {
    email = "${var.cf-email}"
    token = "${var.cf-token}"
}
