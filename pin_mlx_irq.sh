#!/bin/bash


for interrupt in $(grep mlx5 /proc/interrupts | awk -F ':' '{print $1}'); do 
   mask=$(echo "${interrupt}%2" | bc)
   echo " setting irq ${interrupt} to ${mask}"
   echo ${mask} > /proc/irq/${interrupt}/smp_affinity_list
   echo ${interrupt} set to $(cat /proc/irq/${interrupt}/smp_affinity_list)
done
