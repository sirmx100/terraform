# Terraform scripts for AWS and Digital Ocean infrastructure setup

# Network Access
Inbound
•
•
•
•
•
Inbound 22 1 on every VM & 50050 on the C2 servers, only from the mx_admin IP.
Inbound 53, 80 & 443 on the redirectors, from any source 2 .
Inbound 80 & 443 on the payload delivery server, only from the HTTP/S redirector IP.
Inbound 53 on the DNS C2 server, only from the redirector IPs.
Inbound 80 & 443 on the HTTP/S C2 server, from any source 2 .
1
I’m using the same SSH key across all instances for this post - separate them out as much as
you like.
2
Again, I’m leaving things loosey-goosey. You may want to restrict these to something more
sensible (e.g. the CIDR range of your visitor).
Outbound
•
Outbound 53, 80, 443 on each VM to any destination for installing stuff 3 .
3
You can leave these open for initial installations, then close them afterwards.Cloud Segregation
•
•
The redirectors will be hosted in AWS EC2.
The C2 &  delivery servers will be hosted in Digital Ocean.
Domains
mx.site & mxx.site are already configured to use Cloudflare DNS, but are
currently without records.
rekt.site
•
•
•
mxx.site will be used for DNS Beacons, for which we’ll need an A & NS record.
NS record -> DNS redirector IP.
A record for webdisk -> ns1.mxx.site .
mx.site
•
•
•
{support, cpanel}.mx.site -> HTTP/S redirector.
static.mx.site -> HTTP/S C2 server.
CloudFront Web Distribution for static.mx.site .
