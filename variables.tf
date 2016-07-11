# Variables
variable name {
    description = "The name of the packet_filter"
    default = "packet_filter"
}

variable zone {
  description = "The zone of the packet_filter"
  default = "is1b"
}

variable ssh_source_nw {
    default = "0.0.0.0/0"
}
variable ssh_port {
    default = "22"
}
variable ntp_source_nw{
    default = "210.188.224.14" # ntp1.sakura.ad.jp
}