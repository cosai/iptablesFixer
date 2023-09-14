#!/bin/bash
if [ -f "ipcommands.sh" ]; then
    rm ./ipcommands.sh
fi
if [ -f "newrules.txth" ]; then
    rm ./newrules.txt
fi
if [ -f "iptables.up.rules" ]; then
    rm ./iptables.up.rules
fi

# checking the connected devices and creating a shell script for each device
# to be added to iptables 
python3 ./createtables.py

# ipcommands is created by the python script now we can run it.
sudo /bin/sh ./ipcommands.sh

# we are saving the rules, in case we can use the file to restore
sudo iptables-save > iptables.up.rules

echo now write those: 
echo sudo apt install iptables-persistent
echo sudo systemctl enable netfilter-persistent.service
echo ......
echo ....
echo Note:
echo instead of creating this shell file iptables-persistent should be downloaded
echo if you have ufw please remove it first

#echo '#!/bin/sh' > /etc/network/if-pre-up.d/iptables      
#echo "`which iptables-restore` < /home/user/CurrusCode/iptablesGenerate/iptables.up.rules" >> /etc/network/if-pre-up.d/iptables
#sudo chmod +x /etc/network/if-pre-up.d/iptables
