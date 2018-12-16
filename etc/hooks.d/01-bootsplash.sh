#!/bin/bash

if [ "$ROTATE" != "" ]; then
	if [ -d "/usr/share/bootsplash-$ROTATE" ]; then
		echo "Linking /usr/share/bootsplash-$ROTATE to /usr/share/bootsplash"
		rm -f /usr/share/bootsplash
		ln -s "/usr/share/bootsplash-$ROTATE" /usr/share/bootsplash
	fi
fi
