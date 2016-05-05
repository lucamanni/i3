!#/bin/bash
scrot '%F--%I:%M:%S:%p--$wx$h--scrot.png' -e 'mv $f /home/luca/Immagini/Screenshots/'
notify-send -t 500 -a Scrot "Screenshot Taken"
#sleep 2 && thunar /home/luca/Immagini/Screenshots
