# Name of the your virtual machines
$vmName = '*'

# Choose between Standard_LRS, StandardSSD_LRS and Premium_LRS based on your scenario
$storageType = 'Standard_LRS'

# Get all disks in the resource group of the VM
$vmDisks = Get-AzDisk

# For disks that belong to the selected VM, convert to Premium storage
foreach ($disk in $vmDisks)
{
        if ($vmName -eq "*" -or $disk.ManagedBy -in $vmNames) {
                $disk.Sku = [Microsoft.Azure.Management.Compute.Models.DiskSku]::new($storageType)
                $disk | Update-AzDisk
        }
}
