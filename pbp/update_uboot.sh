#!/bin/bash

HEIGHT=15
WIDTH=40
CHOICE_HEIGHT=4
BACKTITLE="Made by smartfridge"
TITLE="Uboot Installer"
MENU="Choose one of the following options:"

OPTIONS=(1 "Install Mainline Uboot"
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
            echo "UNFINISHED"
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
