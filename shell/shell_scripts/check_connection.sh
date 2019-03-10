#!/bin/bash

# put any address here, e.g.: google.com
read -p "Enter a host name you want to ping: " HOST
echo "Ping address: ${HOST}"

echo "===================================================="

ping -c 1 ${HOST}

# simplify the return status of the original ping command
if [ "$?" -eq "0" ]
then
  echo "${HOST} is reachable."
  exit 0
else
  echo "${HOST} is unreachable."
  exit 1
fi
