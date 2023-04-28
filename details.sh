
#!/bin/bash
echo "this script will provid information about the local system"
#Gives hostname
echo $hostname
#gives user excuted this script
echo $(whoami)
#GIVES LIST OF users in the system
USERS=$cat /etc/passwd |cut -d ":" -f 1
echo $USERS
