#!/bin/sh

# df -h lista todos os discos e parições do sitema
system_info=`df -h` # Poderia ser system_info=$(df -h)
echo "$system_info"
