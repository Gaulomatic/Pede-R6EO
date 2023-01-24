# EFI-Ordner Tobias' Computer
* Intel Core i9 10980XE
* Asus Rampge Extreme Omega (BIOS 802)
* AMD Radeon Vega 64 (PCIE_1/x16)
* 2 x Western Digital SN750 2TB (DIMM2_1, DIMM2_2)
* Broadcom BCM943602CDP (PCIE_3/x4)
* Areca ARC-1224 (PCIE_4/x16)

## Bootloader
[N-D-K Open Core](https://github.com/n-d-k/OpenCorePkg) 0.5.8 Final

## ACPI Patches
* `_DSM -> XDSM`
* `_OSI -> XOSI`
* `PC00 -> PCI0`
* `LPC0 -> LPCB`
* `PMC1 -> PMCR`
* `XHCI -> XHC_`
* `SAT0 -> SATA`
* `GBE1 -> GIGE`
* `FPU_ -> MATH`
* `TMR_ -> TIMR`
* `PIC_ -> IPIC`
* `SMBS._ADR -> XSBU.XADR`
  * `PCI0.SMBS` und `PCI0.SBUS` haben beide die Device-ID `1F,4` (`0x001F0004`). Damit `SBUS` im IORegistryExplorer
     auftaucht, muss die Gerätekennung von`SMBS` zunächst umbenannt werden.
* `CP00 -> PR00` bis `CP37 -> PR55`
  * für Intel Core i9 10980XE

## SSDTs
* `SSDT-BASE-EC`
  * Benennt um: `PCI0.LPCB.EC0` -> `PCI0.LPCB.EC`

* `SSDT-BASE-PLUGIN`
  * Setzt den PlugInType für `SCK0.PR00` auf `1`

* `SSDT-BASE-SBUS`
  * Erstellt Device: `PCI0.SBUS.BUS0` (Intel X299 Series System Management Bus)

* `SSDT-BASE-USBX`
  * Erstellt Device: `USBX`
  * Setzt Werte USB-Powermanagement

* `SSDT-CORE-DTGP`
  * Erstellt Methode: `DTGP`

* `SSDT-CORE-XOSI`
  * Erstellt Methode: `XOSI`
  * Gibt als OS Windows 10 1903 zurück (Windows 2019)

* `SSDT-LOCAL-ARPT`
  * Benennt um: `PCI0.RP21.PXSX` -> `PCI0.RP21.ARPT` (Airport Extreme)
  
* `SSDT-OSY86-USBWAKE`
  * Gehört zu der Kext `USBWakeFixup.kext` und sorgt dafür, daß wenn ein USB-Gerät den Sleep beendet,
    der Bildschirm eingeschaltet wird. 
  * Quelle: [osy86 GitHub](https://github.com/osy86/USBWakeFixup)

* `SSDT-R6EO-ANS1`
  * Benennt um: `PCI0.BR3A.SL09` -> `PCI0.BR3A.ANS1` (NVMe DIMM2_1)

* `SSDT-R6EO-ANS2`
  * Benennt um: `PCI0.BR3D.SL0C` -> `PCI0.BR3D.ANS1` (NVMe DIMM2_2)

* `SSDT-R6EO-XGBE`
  * Benennt um: `PCI0.RP07.PXSX` -> `PCI0.RP07.XGBE` (Aquantia AQC107 10-Gigabit Ethernet)

* `SSDT-R6EO-XHC`
  * Setzt DeviceProperties für: `PCI0.XHC` (Intel X299 Series Chipset XHCI Controller)

* `SSDT-R6EO-XHC2`
  * Benennt um: `PCI0.RP05.PXSX` -> `PCI0.RP05.XHC2` (ASMedia ASM2142 USB 3.1 Rückseite)  
  * Setzt DeviceProperties für: `PCI0.XHC2`

* `SSDT-R6EO-XHC3`
  * Benennt um: `PCI0.RP13.PXSX` -> `PCI0.RP13.XHC3` (ASMedia ASM2142 USB 3.1 Front)  
  * Setzt DeviceProperties für: `PCI0.XHC3`

* `SSDT-X299-MCHC`
  * Erstellt Device: `PCI0.MCHC`
  
* `SSDT-X299-THSS`
  * Erstellt Device `PCI0.THSS` für die Device-ID `14,2` (`0x00140002`) (Intel 300 Series Thermal Subsystem)

## Kexts
* AGPMInjector.kext (MacPro7,1 / Radeon 64)
* AppleALC.kext
* ArcMSR.kext
* IntelMausi.kext
* Lilu.kext
* MacProMemoryNotificationDisabler.kext
* SMCProcessor.kext
* SMCSuperIO.kext
* USBInjectAll.kext (**DISABLED**)
* USBPortsR6EO.kext
* USBWakeFixup.kext
* VirtualSMC.kext
* VoodooTSCSync.kext
* WhateverGreen.kext

## Anmerkungen
* Sleep geht nicht. Der erste Sleep klappt, ab dem zweiten kackt der Rechner ab. Daher ist `SSDT-X299-SBUS.aml` aktiviert.
Diese SSDT fügt `PCI0.SBUS` `BUS0` hinzu, sodaß der entsprehende Treiber von macOS geladen wird
(`System Management Bus` unter `PCI`). Ein Nebeneffekt ist, daß der Rechner nicht mehr in den S3-Modus wechselt.
Man kann nicht alles haben.

* Es gibt eine Seltsamkeit in Open Core. Das Gerät `XHCI` kann nicht per SSDT umbenannt werden, da es an diversen
Stellen in der DSDT erwähnt wird. Daher wird es über `Kernel->Patch` umbenannt. Setsamerweise wird dann aber die
`SSDT-R6EO-XHC.aml` nicht mehr angewandt, weshalb die Daten für Powermanagement für `XCH` fehlen. Keine Ahnung, wie
man einen hexadezimalen Zahlenwert in OC per `DeviceProperties->Add` hinzufügt.
