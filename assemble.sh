#!/bin/bash
# Written by: Hans-Filip Elo
# Usage: 
# 	assemble.sh FILE USERNAME


# --------------------------------------------

# Filename and path
if [ -z $1 ]
then
	echo " "
	echo "Please enter absolute or relative path (from current dir)"
	echo "for file:"
	read FILEPATH
	FILENAME="$(basename "$FILEPATH")"
	
	echo " "
	echo "Please enter LiU-LOGIN:"
	read USERNAME
else
	FILEPATH="$1"
	FILENAME="$(basename "$FILEPATH")"
fi

# --------------------------------------------

# Username
if [ -z $2 ]
then
	echo " "
	echo "Please enter LiU-LOGIN:"
	read USERNAME
else
	USERNAME="$2"
fi

# --------------------------------------------

# Upload file
scp "$FILEPATH" "$USERNAME"@ixtab.edu.isy.liu.se:

# Run script on server
ssh "$USERNAME"@ixtab.edu.isy.liu.se "./assemble_remote.sh $FILENAME"

# Cat machine code to local file
CATTING="cat ./$FILENAME.lst"
ssh "$USERNAME"@ixtab.edu.isy.liu.se $CATTING > $FILEPATH.lst
