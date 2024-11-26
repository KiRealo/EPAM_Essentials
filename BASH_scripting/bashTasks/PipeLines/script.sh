#! bin/bash

awk -F: '/bin\/false/ {print $1}' passwdReserv | # xargs -I {} sudo usermod -s /bin/bash {}

perl -pi'.old' -e 's/bin\/bash/bin\/false/' passwdReserv
