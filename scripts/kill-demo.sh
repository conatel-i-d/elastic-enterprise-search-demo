#!/bin/bash
#
# Title:      Kill Elastic enterprise search demo
# Author(s):  Guzmán Monné
# URL:        https://github.com/conatel-i-d/scripts
# GNU:        General Public License v3.0
###############################################################################

ansible-playbook playbooks/demo.yml \
  --extra-vars "state=absent"
