#!/bin/sh

echo "Digite um número: "
read number

# -gt GreatThan >
if [ $number -gt -1 ];
then
	echo "$number é um número positivo!"
else
	echo "$number não é positivo!"
fi

# echo \a #bipe?
