#!/bin/bash

containers=($(docker ps -a | awk '{print $1}'| sed 1d))
a=${#containers[@]}

echo  $a

for ((i=0 ; i < $a ; i++))
do
        container=${containers[$((i-1))]}
        docker rm -f $container
done


for i in $(docker ps -aq); do docker rm -f $i; done
for i in $(docker images -aq); do docker rmi -f $i; done

