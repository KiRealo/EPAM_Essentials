 grep '/bin/false' passwdTest | grep -o '^[^:]*' && sed -i 's|/bin/false|/bin/bash|g' passwd.txt
