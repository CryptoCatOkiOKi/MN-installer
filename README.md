Dystem Node / Masternode installer
==================================

The following scripts install masternodes and regular seed / RPC nodes.

The code has been tested against Ubuntu 16.04.

## Install MN Guide

The full Masternode setup guide can be found here:
https://dystem.io/files/MNGuide-V1.1.1.pdf

The one liner to launch the MN install process is:

```  
wget https://raw.githubusercontent.com/Dystem/MN-installer/master/mn_multi_install.sh && chmod 755 mn_multi_install.sh && ./mn_multi_install.sh && dystemd
 ``` 

## Update MN Guide

The one liner to update the MN is:

```  
wget https://raw.githubusercontent.com/Dystem/MN-installer/master/mn_update.sh && chmod 755 mn_update.sh && ./mn_update.sh && dystemd
 ``` 

## Install RPC / Seed node Guide

The one liner to launch the MN install process is:

```  
wget https://raw.githubusercontent.com/Dystem/MN-installer/master/node_install.sh && chmod 755 node_install.sh && ./node_install.sh && dystemd
 ``` 

## Monitor status of masternode whilst syncing / awaiting activation

```  
watch "dystem-cli getinfo && dystem-cli masternode status"
  ``` 
