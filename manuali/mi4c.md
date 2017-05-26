# PROCEDURA PER DOWNGRADE
```
    adb push /path/to/local/rom.zip /update.zip
    adb reboot recovery
```
# PROCEDURA PER FLASHING ROM
```
    adb reboot bootloader
    sudo fastboot oem edl
    sudo fastboot flash recovery twrp.img
    sudo fastboot reboot
```
Qualora non dovesse funzionare
```
    adb sideload 
```
    

    
