# iptablesGenerate

The generated file should be used as pre configuration by the system. We can do it as below. The new rules will be saved in **ipcommands.sh** file. **iprules.txt** file is in fact not used but it is still being kept. The created files by the scripts are in the ignore list. Then the code is commited, they won't be saved/uploaded. 


`sudo vim /etc/sysctl.conf`

Inside the file, find and uncomment the line that reads as follows:

net.ipv4.ip_forward=1

`chmod +x ./updatenetwork.sh`

`sudo ./updatenetwork.sh`

`sudo apt install iptables-persistent`

