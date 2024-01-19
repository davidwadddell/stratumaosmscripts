workers=$(grep pool /etc/hosts | awk '{print $2}' )
for w in ${workers}; do scp pin_mlx_irq.sh azureuser@${w}:. ; done
for w in ${workers}; do ssh azureuser@${w} sudo ./pin_mlx_irq.sh ; done
