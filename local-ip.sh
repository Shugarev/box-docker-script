#!/bin/bash

ifconfig | grep 192 | awk -F ' '  '{print $2}'


ips=($(ip -4  -t -br  address|grep -v ^lo |grep -v ^docker | awk '{print $3}' | sed 's/\/.*//'))
echo "============================================================================="
echo $ips
echo "============================================================================="

echo "============================================================================="
ip -br addr show dev wlp1s0
echo "============================================================================="



# ip addr TYPE := { vlan | veth | vcan | vxcan | dummy | ifb | macvlan | macvtap |  bridge | bond | ipoib | ip6tnl | ipip | sit | vxlan | lowpan |  gre | gretap | erspan | ip6gre | ip6gretap | ip6erspan | vti |          nlmon | can | bond_slave | ipvlan | geneve | bridge_slave |          hsr | macsec | netdevsim }

# 1: lo: <LOOPBACK,UP,LOWER_UP> mtu 65536 qdisc noqueue state UNKNOWN group default qlen 1000
#     link/loopback 00:00:00:00:00:00 brd 00:00:00:00:00:00
#     inet 127.0.0.1/8 scope host lo
#        valid_lft forever preferred_lft forever
#     inet6 ::1/128 scope host 
#        valid_lft forever preferred_lft forever


# ip addr show dev lo
# ip -br addr show dev wlp1s0
# ip -br link show dev wlp1s0
# ip neigh show dev wlp1s0