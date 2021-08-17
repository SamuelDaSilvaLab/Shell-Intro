#!/bin/sh
#-----------------------------#
# Programa para limpar cache  #
#-----------------------------#

percent=60

# Memory Total
ramtotal=`grep -F "MemTotal:" < /proc/meminfo | awk '{print $2}'`

# Memory Free ?
ramlivre=`grep -F "MemFree:"  < /proc/meminfo | awk '{print $2}'`

ramusada=`expr $ramtotal - $ramlivre`

putil=`expr $ramusada \* 100 / $ramtotal`

echo "------------------------"
echo "Dados Memoria..."
echo "Total:      " $ramtotal
echo "Free:       " $ramlivre
echo "Ram usada:  " $ramusada
echo "Porcentagem:" $putil"%"
echo "------------------------"

if [ $putil -gt $percent ];
then
	date=`date`
	echo $date >> /var/log/memoria.log
	echo "Mem. utilizada: $putil %" >> /var/log/memoria.log
	echo "Memoria acima de $percent %, cache foi limpado!";
	sync

	# Dropando cache
	echo 3 > /proc/sys/vm/drop_caches
	swapoff -a
	swapon -a
	echo
	free -m
	echo
	echo "------------------------"
else
	echo "Cache não foi limpado!";
	echo "------------------------"
	unset percent ramtotal ramlivre ramusada putil
	exit $?
fi

