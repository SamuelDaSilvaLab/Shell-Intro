#!/bin/sh

echo "Iniciando..."
echo "Digite sua idade: "
read idade

if [ $idade -eq 18 ];
then
	echo "$idade anos exatos"
elif [ $idade -lt 18 ];
then
	echo "$idade é menor de idade"
elif [ $idade -gt 18 ];
then
	echo "$idade é maior de idade"
fi
echo "Encerrando..."
echo
