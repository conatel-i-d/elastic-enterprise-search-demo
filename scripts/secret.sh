#!/bin/bash
#
# Title:      Handle passwords.yml file
# Author(s):  Guzmán Monné
# URL:        https://github.com/conatel-i-d/scripts
# GNU:        General Public License v3.0
###############################################################################

passwords_file=./passwords.yml
if [ -f $passwords_file ]; then
  ansible-vault edit $passwords_file
else
  ansible-vault create $passwords_file
fi

