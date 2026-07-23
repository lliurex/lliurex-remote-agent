#!/bin/sh

NEW_NAME="anydesk-client.desktop"
OLD_NAME="SAI.desktop"

# the NEW desktop file is provided by lliurex-desktops-keeper package
FIXED_FILE="/usr/share/lliurex-desktops-keeper/custom-desktops/$NEW_NAME"

# get (and check) current user desktop path
DESKTOP_PATH="$(xdg-user-dir DESKTOP)"
if [ "$DESKTOP_PATH" ] && [ -d "$DESKTOP_PATH" ] ; then

	NEW_FILE="$DESKTOP_PATH/$NEW_NAME"
	OLD_FILE="$DESKTOP_PATH/$OLD_NAME"

	# remove 'OLD' and copy 'NEW'
	if [ -e "$OLD_FILE" ] ; then
		rm -f "$OLD_FILE"
	fi
	if [ ! -x "$NEW_FILE" ] ; then
		cp -f "$FIXED_FILE" "$NEW_FILE"
		chmod +x "$NEW_FILE"
	fi
fi

