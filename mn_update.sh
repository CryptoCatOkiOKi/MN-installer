#/bin/bash
         
CONF_FILE="dystem.conf"
CONF_DIR=".dystem"
PORT=65443
RPC_PORT=17100
VERSION=V1.0.0
CORE_VERSION=V1.0.5

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
echo "*      DYSTEM - Masternode updater ${VERSION}    *"
echo "*                                            *"
echo "**********************************************"
echo 
echo "Welcome to the dystem Masternode update script."
echo
echo "Please follow the instructions when asked and press [ENTER] when asked too do so."

sudo killall -9 dystemd
sudo rm -rdf /usr/bin/dystemd 
sudo rm -rdf /usr/bin/dystem-cli
cd
#Pull down and unpack binaries
wget https://github.com/Dystem/dystem-core/releases/download/$CORE_VERSION/mnbin.tar.gz
tar -xzf mnbin.tar.gz
sudo mv bin/* /usr/bin
sudo rm -rdf "/root/bin"
sudo rm -f "/root/mnbin.tar.gz"
sudo rm -f "/root/mn_update.sh"
dystemd
echo "Your masternode is now updated!"