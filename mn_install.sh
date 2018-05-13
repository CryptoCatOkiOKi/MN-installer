#/bin/bash
         
CONF_FILE=dystem.conf
PORT=65443
RPC_PORT=17100

echo "**********************************************"
echo "*		                                       *"
echo "*		               +:.                     *"
echo "*		               +:.                     *"
echo "*		               +:.                     *"
echo "*		               +:.                     *"
echo "*		       ++.,    +:.    ,+..             *"
echo "*		       ++.,    +:.    ,+..             *"
echo "*		        :+.,   +:.   ,+..              *"
echo "*		         :+.,  +:.  ,+..               *"
echo "*		          :+., +:. ,+..                *"
echo "*		          :+., +:. ,+..                *"
echo "*		          ,+..,+++.:+.,                *"
echo "*		           ,+:++++++,,                 *"
echo "*		            .+:.'.:+:                  *"
echo "*		            +:.   ..+                  *"
echo "*		            ++.   ..+                  *"
echo "*		            ,++.,.:+.                  *"
echo "*		             ,+++++:                   *"
echo "*		               ++:                     *"
echo "*		               +:.                     *"
echo "*		               +:.                     *"
echo "*		               ++.                     *"
echo "*		               ++.                     *"
echo "*                                            *"
echo "*                                            *"
echo "*    DYSTEM - Masternode installer 1.0.0     *"
echo "*                                            *"
echo "**********************************************"

echo && echo && echo

echo "Welcome to the dystem MN installer."

if [[ $(lsb_release -d) != *16.04* ]]; then
  echo -e "The operating system is not Ubuntu 16.04. You must be running on ubuntu 16.04."
  exit 1
fi

sudo su
apt update -y 
apt upgrade -y 
apt dist-upgrade -y 
apt autoremove -y
apt autoclean -y

apt install -y software-properties-common
add-apt-repository ppa:bitcoin/bitcoin
apt update
apt -y install build-essential libtool autotools-dev automake pkg-config libssl-dev autoconf libssl-dev libgmp3-dev libevent-dev bsdmainutils libboost-all-dev libdb4.8-dev libdb4.8++-dev nano git libminiupnpc-dev libzmq5
cd
#replace with pre compiled binaries
#git clone https://github.com/Dystem/dystem-core.git 
