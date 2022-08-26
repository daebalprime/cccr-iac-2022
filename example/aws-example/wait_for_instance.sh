#!/bin/bash

while [ ! -f /var/lib/cloud/instance/boot-finished ]; do
  echo -e "Waiting for cloud-init finished..."
  sleep 1
done
