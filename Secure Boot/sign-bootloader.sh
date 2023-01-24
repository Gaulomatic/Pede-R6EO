#!/bin/bash

sbsign --key DB.key --cert DB.crt --output BOOTx64.efi ../EFI/BOOT/BOOTx64.efi
rm ../EFI/BOOT/BOOTx64.efi
mv BOOTx64.efi ../EFI/BOOT

sbsign --key DB.key --cert DB.crt --output OpenCore.efi ../EFI/OC/OpenCore.efi
rm ../EFI/OC/OpenCore.efi
mv OpenCore.efi ../EFI/OC

sbsign --key DB.key --cert DB.crt --output AudioDxe.efi ../EFI/OC/Drivers/AudioDxe.efi
rm ../EFI/OC/Drivers/AudioDxe.efi
mv AudioDxe.efi ../EFI/OC/Drivers

sbsign --key DB.key --cert DB.crt --output btrfs_x64.efi ../EFI/OC/Drivers/btrfs_x64.efi
rm ../EFI/OC/Drivers/btrfs_x64.efi
mv btrfs_x64.efi ../EFI/OC/Drivers

sbsign --key DB.key --cert DB.crt --output ext4_x64.efi ../EFI/OC/Drivers/ext4_x64.efi
rm ../EFI/OC/Drivers/ext4_x64.efi
mv ext4_x64.efi ../EFI/OC/Drivers

sbsign --key DB.key --cert DB.crt --output HfsPlus.efi ../EFI/OC/Drivers/HfsPlus.efi
rm ../EFI/OC/Drivers/HfsPlus.efi
mv HfsPlus.efi ../EFI/OC/Drivers

sbsign --key DB.key --cert DB.crt --output OpenNtfsDxe.efi ../EFI/OC/Drivers/OpenNtfsDxe.efi
rm ../EFI/OC/Drivers/OpenNtfsDxe.efi
mv OpenNtfsDxe.efi ../EFI/OC/Drivers

sbsign --key DB.key --cert DB.crt --output OpenCanopy.efi ../EFI/OC/Drivers/OpenCanopy.efi
rm ../EFI/OC/Drivers/OpenCanopy.efi
mv OpenCanopy.efi ../EFI/OC/Drivers

sbsign --key DB.key --cert DB.crt --output OpenLinuxBoot.efi ../EFI/OC/Drivers/OpenLinuxBoot.efi
rm ../EFI/OC/Drivers/OpenLinuxBoot.efi
mv OpenLinuxBoot.efi ../EFI/OC/Drivers

sbsign --key DB.key --cert DB.crt --output OpenRuntime.efi ../EFI/OC/Drivers/OpenRuntime.efi
rm ../EFI/OC/Drivers/OpenRuntime.efi
mv OpenRuntime.efi ../EFI/OC/Drivers





sbsign --key DB.key --cert DB.crt --output CleanNvram.efi ../EFI/OC/Tools/CleanNvram.efi
rm ../EFI/OC/Tools/CleanNvram.efi
mv CleanNvram.efi ../EFI/OC/Tools

sbsign --key DB.key --cert DB.crt --output OpenShell.efi ../EFI/OC/Tools/OpenShell.efi
rm ../EFI/OC/Tools/OpenShell.efi
mv OpenShell.efi ../EFI/OC/Tools

sbsign --key DB.key --cert DB.crt --output ResetSystem.efi ../EFI/OC/Tools/ResetSystem.efi
rm ../EFI/OC/Tools/ResetSystem.efi
mv ResetSystem.efi ../EFI/OC/Tools

sbsign --key DB.key --cert DB.crt --output Shell.efi ../EFI/OC/Tools/Shell.efi
rm ../EFI/OC/Tools/Shell.efi
mv Shell.efi ../EFI/OC/Tools