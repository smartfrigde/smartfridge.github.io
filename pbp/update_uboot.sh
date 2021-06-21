#!/bin/bash

HEIGHT=15
WIDTH=40
CHOICE_HEIGHT=3
BACKTITLE="Made by smartfridge."
TITLE="Uboot Installer"
MENU="Choose one of the following options:"

OPTIONS=(1 "Install Mainline BSP Uboot"
         2 "Install MrFixIt Uboot"
         3 "Exit")

CHOICE=$(dialog --clear \
                --backtitle "$BACKTITLE" \
                --title "$TITLE" \
                --menu "$MENU" \
                $HEIGHT $WIDTH $CHOICE_HEIGHT \
                "${OPTIONS[@]}" \
                2>&1 >/dev/tty)

clear
case $CHOICE in
        1)
	   echo 'Installing Mainline BSP Uboot.'
           wget -O /tmp/idbloader.img https://gitlab.manjaro.org/manjaro-arm/packages/core/uboot-pinebookpro-bsp/-/raw/master/idbloader.img?inline=false
           wget -O /tmp/uboot.img https://gitlab.manjaro.org/manjaro-arm/packages/core/uboot-pinebookpro-bsp/-/raw/master/uboot.img?inline=false
           wget -O /tmp/trust.img https://gitlab.manjaro.org/manjaro-arm/packages/core/uboot-pinebookpro-bsp/-/raw/master/trust.img?inline=false
           sudo dd if=/tmp/idbloader.img of=/dev/mmcblk2 seek=64 conv=notrunc
           sudo dd if=/tmp/uboot.img of=/dev/mmcblk2 seek=16384 conv=notrunc
           sudo dd if=/tmp/trust.img of=/dev/mmcblk2 seek=24576 conv=notrunc
            ;;
        2)
            echo 'Installing MrFixIt Uboot.'
	    wget -O /tmp/idbloader.img https://smartfridge.ml/pbp/idbloader.img 
            wget -O /tmp/uboot.img https://smartfridge.ml/pbp/uboot.img 
           wget -O /tmp/trust.img https://smartfridge.ml/pbp/trust.img
           sudo dd if=/tmp/idbloader.img of=/dev/mmcblk2 seek=64 conv=notrunc
           sudo dd if=/tmp/uboot.img of=/dev/mmcblk2 seek=16384 conv=notrunc
           sudo dd if=/tmp/trust.img of=/dev/mmcblk2 seek=24576 conv=notrunc
            ;;
        3)
            echo 'Thanks for using my script ;)'
            ;;
esac
