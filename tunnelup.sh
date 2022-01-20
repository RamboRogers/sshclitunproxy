#!/bin/sh
echo "/root/.ssh/id_rsa.pub"
cat /root/.ssh/id_rsa.pub

while true
do
   tinyproxy
   ssh -tt -i /root/.ssh/id_rsa tunnel@192.168.1.14 -R 9999:0.0.0.0:8888 -o "StrictHostKeyChecking=no"
   sleep 5
   echo "`date`: Tunnel Died"
done
