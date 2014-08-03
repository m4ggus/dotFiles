#!/bin/bash
SCRIPT_FILE=$(readlink -f $0)
SCRIPT_PATH=$(dirname $SCRIPT_FILE)
DOTFILES=(".vimrc" ".config/openbox/" ".config/tint2/")

function dotInstall {
	echo $1
}

echo $SCRIPT_FILE
echo $SCRIPT_PATH
echo ${#DOTFILES[@]} configs...

for((i=0;i<${#DOTFILES[@]};i++))
do
	echo "$i: ${DOTFILES[$i]} ${#DOTFILES[$i]}"
	dotInstall $SCRIPT_PATH/${DOTFILES[$i]}
done


DOTFILE_TINT2=~/dotFiles/tint2rc
CONFIG_TINT2=~/.config/tint2/tint2rc
CONFIG_TINT2_BAK="${CONFIG_TINT2}.bak"

if [ -f $CONFIG_TINT2 ]; then
	if [ -f $CONFIG_TINT2_BAK ]; then
		echo "Backup already exists"
		exit 255
	fi
#	mv $CONFIG_TINT2 $CONFIG_TINT2_BAK
#	ln -s $DOTFILE_TINT2 $CONFIG_TINT2
fi
