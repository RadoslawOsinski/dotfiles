#!/bin/sh
if  zenity --question --title "Alert" --text "Do you really want to shutdown ?"; then
	sudo shutdown -h now
fi

