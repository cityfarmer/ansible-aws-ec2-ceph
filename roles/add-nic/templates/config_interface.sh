#!/bin/bash
#set -x
. ~/.bash_profile

privip=`aws ec2 describe-network-interfaces --filters Name=description,Values=Eagle-Ceph-Cluster-Interface | grep PrivateIpAddress\" | tail -1 | awk -F':' '{print $2}' | sed -e 's/[\" ]//g'`
nmcli con add type ethernet con-name eth1 ifname eth1 ip4 ${privip}/20

exit 0

