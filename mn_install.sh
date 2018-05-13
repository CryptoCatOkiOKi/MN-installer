#/bin/bash
         
CONF_FILE="dystem.conf"
CONF_DIR=".dystem"
PORT=65443
RPC_PORT=17100
VERSION=V1.0.2

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

echo && echo && echo

echo "Welcome to the dystem MN installer. Please press enter when asked and follow the instructions. Are you sure you want to install ? type y/n followed by [ENTER]:"
read AGREE

if [[ $AGREE =~ "y" ]] ; then

	sudo apt-get -y update
	sudo apt-get -y upgrade
	sudo apt-get -y dist-upgrade
	sudo apt-get -y autoremove
	sudo apt-get -y autoclean
	sudo apt-get -y install software-properties-common
	sudo add-apt-repository ppa:bitcoin/bitcoin
	sudo apt-get update
	sudo apt-get -y install build-essential libtool autotools-dev automake pkg-config libssl-dev autoconf libssl-dev libgmp3-dev libevent-dev bsdmainutils libboost-all-dev libdb4.8-dev libdb4.8++-dev nano git libminiupnpc-dev libzmq5

	cd /var
	sudo touch swap.img
	sudo chmod 600 swap.img
	sudo dd if=/dev/zero of=/var/swap.img bs=1024k count=2000
	sudo mkswap /var/swap.img
	sudo swapon /var/swap.img
	sudo free
	sudo echo "/var/swap.img none swap sw 0 0" >> /etc/fstab
	cd

	wget https://github.com/Dystem/dystem-core/releases/download/$VERSION/mnbin.tar.gz
	tar -xzf mnbin.tar.gz
	sudo mv bin/* /usr/bin
	mkdir -p ~/bin
	echo 'export PATH=~/bin:$PATH' > ~/.bash_aliases
	source ~/.bashrc

	echo "We are now going to setup the masternode"
	echo "Please type the IP address of this server followed by [ENTER]:"
	read IP_ADDR

	echo "Please type the 'Alias' for this masternode followed by [ENTER]:"
  	read ALIAS

  	echo "Please type the 'masternode private key' for this $ALIAS followed by [ENTER]:"
  	read MN_PRIVATE_KEY

  	mkdir -p $CONF_DIR
  	cd $CONF_DIR
  	touch $CONF_FILE 


fi 
