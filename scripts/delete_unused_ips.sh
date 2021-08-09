USED_IPS=$(az network nic list --query [].ipConfigurations[].publicIpAddress.id --output tsv)
ALL_IPS=$(az network public-ip list --query "[].id" --output tsv)
for IP in $ALL_IPS
do
        if [[ "$USED_IPS" != *"$IP"* ]]; then
                echo $IP
                az network public-ip delete --ids $IP
        fi
done
