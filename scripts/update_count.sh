#!/bin/bash

HELD=0 # set how many packages we're holding
PML=$(yaourt -Sup | wc -l)
touch /tmp/udc
UC=$(( $PML - $HELD - 1))

echo -n $UC

if (( UC > 0 ))
then
		echo "\",\"color\": \"#FFF50D" &
        notify-send -a "Available Updates" -u normal "$(yaourt -Qu)"
        sleep 1 && yaourt -Qu > Documenti/updates
        sleep 2 && termite -e "yaourt -Syyua --noconfirm" && i3-msg restart &&
        notify-send -a "Done!" -u normal "Your system is updated"
else
		echo "\",\"color\": \"#909090" &
fi
