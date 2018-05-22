#/bin/bash
         
CONF_FILE="dystem.conf"
CONF_DIR=".dystem"
PORT=65443
RPC_PORT=17100
VERSION=V1.0.4

if [[ $(lsb_release -d) != *16.04* ]]; then
  echo -e "The operating system is not Ubuntu 16.04. You must be running on ubuntu 16.04."
  exit 1
fi

echo "**********************************************"
echo "*                                            *"
echo "*                    +:.                     *"
echo "*                    +:.                     *"
echo "*                    +:.                     *"
echo "*                    +:.                     *"
echo "*            ++.,    +:.    ,+..             *"
echo "*            ++.,    +:.    ,+..             *"
echo "*             :+.,   +:.   ,+..              *"
echo "*              :+.,  +:.  ,+..               *"
echo "*               :+., +:. ,+..                *"
echo "*               :+., +:. ,+..                *"
echo "*               ,+..,+++.:+.,                *"
echo "*                ,+:++++++,,                 *"
echo "*                 .+:.'.:+:                  *"
echo "*                 +:.   ..+                  *"
echo "*                 ++.   ..+                  *"
echo "*                 ,++.,.:+.                  *"
echo "*                  ,+++++:                   *"
echo "*                    ++:                     *"
echo "*                    +:.                     *"
echo "*                    +:.                     *"
echo "*                    ++.                     *"
echo "*                    ++.                     *"
echo "*                                            *"
echo "*                                            *"
echo "*    DYSTEM - Masternode installer ${VERSION}    *"
echo "*                                            *"
echo "**********************************************"
echo 
echo "Welcome to the dystem MN installer."
echo
echo "Please follow the instructions when asked and press [ENTER] when asked too do so."
echo
echo "Are you sure you want to install a dystem masternode? type y/n followed by [ENTER]:"
read AGREE

if [[ $AGREE =~ "y" ]] ; then

	#Install required dependancies
	sudo apt-get -y update
	sudo apt-get -y upgrade
	sudo apt-get -y dist-upgrade
	sudo apt-get -y autoremove
	sudo apt-get -y autoclean
	sudo apt-get -y install software-properties-common
	sudo add-apt-repository ppa:bitcoin/bitcoin
	sudo apt-get update
	sudo apt-get -y install build-essential libtool autotools-dev automake pkg-config libssl-dev libssl-dev libgmp3-dev libevent-dev bsdmainutils libboost-all-dev libdb4.8-dev libdb4.8++-dev libminiupnpc-dev libzmq5

	#Increase swap memory
	cd /var
	sudo touch swap.img
	sudo chmod 600 swap.img
	sudo dd if=/dev/zero of=/var/swap.img bs=1024k count=2000
	sudo mkswap /var/swap.img
	sudo swapon /var/swap.img
	sudo free
	sudo echo "/var/swap.img none swap sw 0 0" >> /etc/fstab
	cd

	#Pull down and unpack binaries
	wget https://github.com/Dystem/dystem-core/releases/download/$VERSION/mnbin.tar.gz
	tar -xzf mnbin.tar.gz
	sudo mv bin/* /usr/bin
	sed -i -e '13i/usr/bin/dystemd || exit 1\' /etc/rc.local
	mkdir -p ~/bin
	echo 'export PATH=~/bin:$PATH' > ~/.bash_aliases
	source ~/.bashrc

	#Get users to input required details
	echo "We are now going to setup the masternode"
	echo
  	echo "Please type the 'masternode private key' for this $ALIAS followed by [ENTER]:"
  	read MN_PRIVATE_KEY

  	#Write config to config file
  	mkdir -p $CONF_DIR
  	cd $CONF_DIR
  	touch $CONF_FILE 

  	touch dystem.conf_TEMP
  	echo "rpcuser=dtem"`shuf -i 100000-10000000 -n 1` >> dystem.conf_TEMP 
  	echo "rpcpassword="`shuf -i 100000-10000000 -n 1` >> dystem.conf_TEMP 
  	echo "rpcallowip=127.0.0.1" >> dystem.conf_TEMP 
  	echo "rpcport=17100" >> dystem.conf_TEMP 
  	echo "listen=1" >> dystem.conf_TEMP 
  	echo "server=1" >> dystem.conf_TEMP 
  	echo "daemon=1" >> dystem.conf_TEMP 
  	echo "masternode=1" >> dystem.conf_TEMP 
  	echo "masternodeaddr=$(hostname  -I | cut -f1 -d' '):$PORT" >> dystem.conf_TEMP 
  	echo "masternodeprivkey=$MN_PRIVATE_KEY" >> dystem.conf_TEMP 
  	echo "maxconnections=256" >> dystem.conf_TEMP 
  	echo "port=65443" >> dystem.conf_TEMP 
  	echo "addnode=209.250.252.236" >> dystem.conf_TEMP 
  	echo "addnode=45.77.231.211" >> dystem.conf_TEMP 
  	echo "addnode=149.28.13.197" >> dystem.conf_TEMP 
  	echo "addnode=108.61.69.42" >> dystem.conf_TEMP 
  	echo "addnode=8.9.30.71" >> dystem.conf_TEMP 
  	echo "addnode=51.15.117.213" >> dystem.conf_TEMP 

  	mv dystem.conf_TEMP dystem.conf
  	sudo rm -rdf "/root/bin"
  	sudo rm -f "/root/mnbin.tar.gz"
  	sudo rm -f "/root/mn_install.sh"

  	echo "Enjoy your masternode rewards! Now if you could get the developers a nice cup of coffee..."
fi 
