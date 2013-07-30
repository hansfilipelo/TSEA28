#!/bin/bash
# Written by: Hans-Filip Elo
# Usage: 
# 	./install.sh

# Ask for username
echo "Please enter your LiU-LOGIN:"
read USERNAME

# cd to script directory
DIR=$( cd "$( dirname "$0" )" && pwd )
cd $DIR

# Sets up key-login if not already configured
./setupKeyLogin.sh $USERNAME ixtab.edu.isy.liu.se

# Uploads assemble_remote.sh to ixtab
scp assemble_remote.sh "$USERNAME"@ixtab.edu.isy.liu.se:

# Checks if upload went ok, meaning key login is configured
if [ $? == 0 ]
then
    echo " " &> /dev/null
else
    echo " "
    echo "Install FAILED!"
    exit
fi

# Makes remote script executable
ssh "$USERNAME"@ixtab.edu.isy.liu.se "chmod 770 assemble_remote.sh"

echo "--------------------------"
echo " "
echo "TYPE ADMINISTRATOR PASSWORD FOR YOUR LOCAL ACCOUNT (sudo) WHEN ASKED"
echo " "
echo "--------------------------"

# Installs assemble.sh
chmod 755 assemble.sh
sudo cp assemble.sh /usr/bin/

echo "--------------------------"
# Checking if install was ok
if [ $? == 0 ]
then
    echo " "
    echo "assemble.sh INSTALLED!"
    echo " "
else
    echo " "
    echo "Install FAILED!"
    echo " "
fi
echo "--------------------------"

exit
