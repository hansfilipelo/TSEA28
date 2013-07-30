TSEA28 scripts
======

Version: 0.4
Release date: 2013-04-28
Written by: Hans-Filip Elo

Purpose: Send assembler code to Institutionen for Systemteknik (ISY) at Linköpings Universitet (LiU) and assemble in order to run in Tutor

Requirements: This script should work on Mac OS X, almost any Linux distribution, Solaris, BSD and other *NIX OSes. It requires OpenSSH and some crypto packages preinstalled on every *NIX-system (that I know of). 

The script has been tested on OS X, Ubuntu and Debian. 

License
======

This software is released as free software. You are free to download, distribute and change it as you like. This software comes with absolutely NO WARRANTY. Use at your own risk. 

Release Notes 
======

Version 0.4
- setupKeyLogin now works if folder .ssh doesn't exist in home folder on target machine. 


Version 0.3
- Install.sh and setupKeyLogin.sh now recognizes if something goes wrong


Version 0.2
- Install.sh now runs setupKeyLogin.sh. No need to manually run setupKeyLogin.sh.

- setupKeyLogin.sh doesn't break key login if already configured. You can use it on multiple clients to login to the same server. If user already has a rsa-key in local .ssh-folder, it will use that key. 

- setupKeyLogin.sh can now be run to set up key login to any server. Usage: "setupKeyLogin.sh username server" or just run setupKeyLogin.sh

- assemble.sh can now be run with "assemble.sh file username" and it won't prompt you for file and username


Version 0.1
- First release


Installation
======

It's recommended to use key-login while using assemble.sh. If you haven't already set up key-login for ixtab.edu.isy.liu.se - the installer will do this for you. 

INSTALL & UPGRADE: Run install.sh as a member of the sudoers file.

  -INSTALLATION ON OS X-

1. Make sure you're logged in as a member of the administrators group.

2. Unzip the zip-archive. 

6. Open the file install.sh with Terminal.

Usage
======

1. Open Terminal

2. Run ONE of the following commands:
	- assemble.sh
	- assemble.sh filepath username

4. Login to Tutor and press Ctrl+F followed by L. 
