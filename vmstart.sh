#!/bin/bash

# Variables (replace with your actual values)
RESOURCE_GROUP="resource_group_name"
VM_NAME="vm_name"

# Get the OS disk name
echo "Fetching OS disk ID..."
os_disk_id=$(az vm show --resource-group $RESOURCE_GROUP --name $VM_NAME --query "storageProfile.osDisk.managedDisk.id" -o tsv)

# Update the OS disk type to HDD (Standard_LRS)
az disk update --ids $os_disk_id --sku Premium_LRS

# Start the VM again
echo "Starting the VM..."
az vm start --resource-group $RESOURCE_GROUP --name $VM_NAME

echo "Disk type changed and VM Started successfully."
