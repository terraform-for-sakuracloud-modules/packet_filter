resource "sakuracloud_packet_filter" "packet_filter" {
    name = "${var.name}"
    zone = "${var.zone}"
    expressions = {
        protocol = "tcp"
        source_nw = "${var.ssh_source_nw}"
        dest_port = "${var.ssh_port}"
        description = "Allow SSH"
        allow = true
    }
    expressions = {
        protocol = "tcp"
        source_nw = "0.0.0.0/0"
        dest_port = "80"
        description = "Allow www"
        allow = true
    }
    expressions = {
        protocol = "tcp"
        source_nw = "0.0.0.0/0"
        dest_port = "443"
        description = "Allow www(ssl)"
        allow = true
    }
    expressions = {
        protocol = "udp"
        source_nw = "${var.ntp_source_nw}"
        source_port = "123"
        description = "Allow NTP response"
        allow = true
    }
    expressions = {
        protocol = "tcp"
        source_nw = "0.0.0.0/0"
        dest_port = "32768-61000"
        description = "Allow return packet(tcp)"
        allow = true
    }
    expressions = {
        protocol = "udp"
        source_nw = "0.0.0.0/0"
        dest_port = "32768-61000"
        description = "Allow return packet(udp)"
        allow = true
    }
    expressions = {
        protocol = "icmp"
        source_nw = "0.0.0.0"
        allow = true
        description = "Allow all icmp"
    }
    expressions = {
        protocol = "fragment"
        source_nw = "0.0.0.0"
        allow = true
        description = "Allow all fragment"
    }
    expressions = {
        protocol = "ip"
        source_nw = "0.0.0.0"
        allow = false
        description = "Deny all"
    }
}
