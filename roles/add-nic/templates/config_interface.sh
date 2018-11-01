#!/bin/bash
#set -x
. ~/.bash_profile

inst=`wget -q -O - http://169.254.169.254/latest/meta-data/instance-id`
privip=`aws ec2 describe-network-interfaces --filters Name=description,Values=Eagle-Ceph-Cluster-Interface Name=attachment.instance-id,Values=$inst | grep PrivateIpAddress\" | tail -1 | awk -F':' '{print $2}' | sed -e 's/[\" ]//g'`
nmcli con add type ethernet con-name eth1 ifname eth1 ip4 ${privip}/20

exit 0

