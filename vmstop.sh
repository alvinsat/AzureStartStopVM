#!/bin/bash

# Variables (replace with your actual values)
RESOURCE_GROUP="resource_group_name"
VM_NAME="vm_name"

# Stop the VM
echo "Stopping the VM..."
az vm stop --resource-group $RESOURCE_GROUP --name $VM_NAME

# Deallocate the VM
echo "Deallocating the VM..."
az vm deallocate --resource-group $RESOURCE_GROUP --name $VM_NAME

# Get the OS disk name
echo "Fetching OS disk ID..."
os_disk_id=$(az vm show --resource-group $RESOURCE_GROUP --name $VM_NAME --query "storageProfile.osDisk.managedDisk.id" -o tsv)

# Update the OS disk type to HDD (Standard_LRS)
az disk update --ids $os_disk_id --sku Standard_LRS

echo "Disk type changed and VM stopped successfully."
