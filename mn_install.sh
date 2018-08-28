#/bin/bash
         
CONF_FILE="dystem.conf"
CONF_DIR=".dystem"
PORT=65443
RPC_PORT=17100
VERSION=V1.0.6

if [[ $(lsb_release -d) != *16.04* ]]; then
  echo -e "The operating system is not Ubuntu 16.04. You must be running on ubuntu 16.04."
  exit 1
fi

printf '\e[48;5;0m \e[48;5;0m \e[48;5;0m \e[48;5;0m \e[48;5;0m \e[48;5;0m \e[48;5;0m \e[48;5;0m \e[48;5;0m \e[48;5;0m \e[48;5;0m \e[48;5;0m\e[38;5;146m▄\e[48;5;0m\e[38;5;146m▄\e[48;5;0m\e[38;5;146m▄\e[48;5;146m \e[48;5;146m \e[48;5;146m \e[48;5;146m \e[48;5;146m \e[48;5;146m \e[48;5;146m \e[48;5;146m \e[48;5;146m \e[48;5;146m \e[48;5;7m\e[38;5;146m▄\e[48;5;152m\e[38;5;146m▄\e[48;5;0m\e[38;5;146m▄\e[48;5;0m\e[38;5;251m▄\e[48;5;0m\e[38;5;250m▄\e[48;5;0m \e[48;5;0m \e[48;5;0m \e[48;5;0m \e[48;5;0m \e[48;5;0m \e[48;5;0m \e[48;5;0m \e[48;5;0m \e[48;5;0m \e[48;5;0m \e[0m
\e[48;5;0m \e[48;5;0m \e[48;5;0m \e[48;5;0m \e[48;5;0m \e[48;5;0m \e[48;5;0m \e[48;5;0m \e[48;5;0m \e[48;5;7m\e[38;5;146m▄\e[48;5;146m \e[48;5;146m \e[48;5;146m \e[48;5;146m \e[48;5;146m \e[48;5;146m \e[48;5;146m \e[48;5;146m \e[48;5;146m \e[48;5;146m \e[48;5;146m \e[48;5;146m \e[48;5;146m \e[48;5;146m \e[48;5;146m \e[48;5;146m \e[48;5;146m \e[48;5;146m \e[48;5;251m\e[38;5;146m▄\e[48;5;251m\e[38;5;146m▄\e[48;5;7m\e[38;5;251m▄\e[48;5;0m\e[38;5;7m▄\e[48;5;0m \e[48;5;0m \e[48;5;0m \e[48;5;0m \e[48;5;0m \e[48;5;0m \e[48;5;0m \e[48;5;0m \e[0m
\e[48;5;0m \e[48;5;0m \e[48;5;0m \e[48;5;0m \e[48;5;0m \e[48;5;0m \e[48;5;0m \e[48;5;0m \e[48;5;0m \e[48;5;0m \e[48;5;0m \e[48;5;0m \e[48;5;0m \e[48;5;0m \e[48;5;0m \e[48;5;0m \e[48;5;0m \e[48;5;0m \e[48;5;0m \e[48;5;0m \e[48;5;0m \e[48;5;0m \e[48;5;0m \e[48;5;0m \e[48;5;0m \e[48;5;146m\e[38;5;0m▄\e[48;5;146m\e[38;5;0m▄\e[48;5;146m\e[38;5;15m▄\e[48;5;146m \e[48;5;146m \e[48;5;146m \e[48;5;251m\e[38;5;146m▄\e[48;5;251m\e[38;5;152m▄\e[48;5;0m\e[38;5;251m▄\e[48;5;0m\e[38;5;248m▄\e[48;5;0m \e[48;5;0m \e[48;5;0m \e[48;5;0m \e[48;5;0m \e[0m
\e[48;5;0m \e[48;5;0m \e[48;5;0m \e[48;5;0m \e[48;5;0m\e[38;5;110m▄\e[48;5;110m \e[48;5;146m\e[38;5;110m▄\e[48;5;146m\e[38;5;110m▄\e[48;5;146m \e[48;5;146m \e[48;5;146m \e[48;5;146m \e[48;5;146m \e[48;5;146m \e[48;5;146m \e[48;5;146m \e[48;5;146m \e[48;5;146m \e[48;5;146m \e[48;5;146m \e[48;5;146m \e[48;5;146m \e[48;5;146m \e[48;5;251m\e[38;5;146m▄\e[48;5;252m\e[38;5;146m▄\e[48;5;0m\e[38;5;152m▄\e[48;5;0m\e[38;5;152m▄\e[48;5;0m \e[48;5;0m \e[48;5;146m\e[38;5;0m▄\e[48;5;146m\e[38;5;0m▄\e[48;5;146m \e[48;5;146m \e[48;5;152m\e[38;5;146m▄\e[48;5;251m\e[38;5;146m▄\e[48;5;0m\e[38;5;251m▄\e[48;5;0m \e[48;5;0m \e[48;5;0m \e[48;5;0m \e[0m
\e[48;5;0m \e[48;5;0m \e[48;5;0m \e[48;5;110m \e[48;5;110m \e[48;5;110m \e[48;5;110m \e[48;5;110m \e[48;5;110m \e[48;5;146m\e[38;5;110m▄\e[48;5;146m \e[48;5;146m \e[48;5;146m \e[48;5;146m \e[48;5;146m \e[48;5;146m \e[48;5;146m \e[48;5;146m \e[48;5;146m \e[48;5;146m \e[48;5;146m \e[48;5;146m \e[48;5;146m \e[48;5;146m \e[48;5;146m \e[48;5;146m \e[48;5;152m\e[38;5;146m▄\e[48;5;251m\e[38;5;146m▄\e[48;5;7m\e[38;5;251m▄\e[48;5;0m\e[38;5;7m▄\e[48;5;0m \e[48;5;146m\e[38;5;0m▄\e[48;5;146m\e[38;5;0m▄\e[48;5;146m \e[48;5;146m \e[48;5;146m \e[48;5;152m\e[38;5;146m▄\e[48;5;0m\e[38;5;159m▄\e[48;5;0m \e[48;5;0m \e[0m
\e[48;5;0m \e[48;5;0m \e[48;5;0m \e[48;5;0m \e[48;5;0m \e[48;5;0m \e[48;5;0m \e[48;5;0m \e[48;5;0m \e[48;5;0m \e[48;5;0m \e[48;5;0m \e[48;5;0m \e[48;5;0m \e[48;5;0m \e[48;5;0m \e[48;5;0m \e[48;5;0m \e[48;5;0m \e[48;5;0m \e[48;5;0m \e[48;5;0m \e[48;5;0m \e[48;5;248m\e[38;5;0m▄\e[48;5;146m\e[38;5;0m▄\e[48;5;146m\e[38;5;0m▄\e[48;5;146m \e[48;5;146m \e[48;5;146m \e[48;5;146m \e[48;5;152m\e[38;5;7m▄\e[48;5;0m\e[38;5;147m▄\e[48;5;0m \e[48;5;146m\e[38;5;0m▄\e[48;5;146m \e[48;5;146m \e[48;5;146m \e[48;5;146m \e[48;5;0m\e[38;5;146m▄\e[48;5;0m \e[0m
\e[48;5;0m \e[48;5;110m \e[48;5;110m \e[48;5;110m \e[48;5;110m \e[48;5;110m \e[48;5;110m \e[48;5;110m \e[48;5;110m \e[48;5;146m\e[38;5;110m▄\e[48;5;146m \e[48;5;146m \e[48;5;146m \e[48;5;146m \e[48;5;146m \e[48;5;146m \e[48;5;146m \e[48;5;146m \e[48;5;146m \e[48;5;146m \e[48;5;146m \e[48;5;146m \e[48;5;251m\e[38;5;146m▄\e[48;5;0m\e[38;5;251m▄\e[48;5;0m\e[38;5;251m▄\e[48;5;0m \e[48;5;0m \e[48;5;146m\e[38;5;0m▄\e[48;5;146m \e[48;5;146m \e[48;5;146m \e[48;5;146m \e[48;5;0m\e[38;5;146m▄\e[48;5;0m \e[48;5;7m\e[38;5;0m▄\e[48;5;146m \e[48;5;146m \e[48;5;146m \e[48;5;146m \e[48;5;0m \e[0m
\e[48;5;110m \e[48;5;110m \e[48;5;110m \e[48;5;110m \e[48;5;110m \e[48;5;110m \e[48;5;110m \e[48;5;110m \e[48;5;110m \e[48;5;110m \e[48;5;110m \e[48;5;110m \e[48;5;146m\e[38;5;110m▄\e[48;5;146m \e[48;5;146m \e[48;5;146m \e[48;5;146m \e[48;5;146m \e[48;5;146m \e[48;5;146m \e[48;5;146m \e[48;5;146m \e[48;5;146m \e[48;5;146m \e[48;5;146m \e[48;5;251m\e[38;5;146m▄\e[48;5;0m\e[38;5;7m▄\e[48;5;0m \e[48;5;0m \e[48;5;146m \e[48;5;146m \e[48;5;146m \e[48;5;146m \e[48;5;0m\e[38;5;105m▄\e[48;5;0m \e[48;5;146m\e[38;5;0m▄\e[48;5;146m \e[48;5;146m \e[48;5;146m \e[48;5;146m \e[0m
\e[48;5;0m \e[48;5;0m \e[48;5;0m \e[48;5;0m \e[48;5;0m \e[48;5;0m \e[48;5;0m \e[48;5;0m \e[48;5;0m \e[48;5;0m \e[48;5;0m \e[48;5;0m \e[48;5;0m \e[48;5;0m \e[48;5;0m \e[48;5;0m \e[48;5;0m \e[48;5;0m \e[48;5;0m \e[48;5;0m \e[48;5;0m \e[48;5;0m \e[48;5;146m\e[38;5;0m▄\e[48;5;146m \e[48;5;146m \e[48;5;146m \e[48;5;146m \e[48;5;0m\e[38;5;146m▄\e[48;5;0m \e[48;5;147m\e[38;5;0m▄\e[48;5;146m \e[48;5;146m \e[48;5;146m \e[48;5;146m \e[48;5;0m \e[48;5;0m \e[48;5;146m \e[48;5;146m \e[48;5;146m \e[48;5;146m \e[0m
\e[48;5;110m\e[38;5;68m▄\e[48;5;110m \e[48;5;110m \e[48;5;110m \e[48;5;110m \e[48;5;110m \e[48;5;110m \e[48;5;110m \e[48;5;110m \e[48;5;110m \e[48;5;110m \e[48;5;110m \e[48;5;110m \e[48;5;146m\e[38;5;110m▄\e[48;5;146m \e[48;5;146m \e[48;5;146m \e[48;5;146m \e[48;5;146m \e[48;5;146m \e[48;5;152m\e[38;5;146m▄\e[48;5;0m\e[38;5;146m▄\e[48;5;0m \e[48;5;0m \e[48;5;146m \e[48;5;146m \e[48;5;146m \e[48;5;146m \e[48;5;0m \e[48;5;0m \e[48;5;146m \e[48;5;146m \e[48;5;146m \e[48;5;146m \e[48;5;0m \e[48;5;0m \e[48;5;146m \e[48;5;146m \e[48;5;146m \e[48;5;146m \e[0m
\e[48;5;68m \e[48;5;68m \e[48;5;68m \e[48;5;110m\e[38;5;68m▄\e[48;5;110m \e[48;5;110m \e[48;5;110m \e[48;5;110m \e[48;5;110m \e[48;5;110m \e[48;5;110m \e[48;5;110m \e[48;5;110m \e[48;5;110m \e[48;5;110m \e[48;5;146m\e[38;5;110m▄\e[48;5;146m\e[38;5;110m▄\e[48;5;146m \e[48;5;146m \e[48;5;146m \e[48;5;146m \e[48;5;146m\e[38;5;0m▄\e[48;5;0m \e[48;5;0m \e[48;5;146m \e[48;5;146m \e[48;5;146m \e[48;5;146m \e[48;5;0m \e[48;5;0m \e[48;5;146m \e[48;5;146m \e[48;5;146m \e[48;5;146m \e[48;5;0m \e[48;5;0m \e[48;5;146m \e[48;5;146m \e[48;5;146m \e[48;5;146m \e[0m
\e[48;5;0m \e[48;5;0m \e[48;5;0m \e[48;5;0m \e[48;5;0m \e[48;5;0m \e[48;5;0m \e[48;5;0m \e[48;5;0m \e[48;5;0m \e[48;5;0m \e[48;5;0m \e[48;5;0m \e[48;5;0m \e[48;5;0m \e[48;5;0m \e[48;5;0m \e[48;5;0m \e[48;5;0m \e[48;5;0m \e[48;5;0m \e[48;5;0m \e[48;5;0m\e[38;5;110m▄\e[48;5;146m\e[38;5;110m▄\e[48;5;146m \e[48;5;146m \e[48;5;146m \e[48;5;146m\e[38;5;0m▄\e[48;5;0m \e[48;5;0m\e[38;5;147m▄\e[48;5;146m \e[48;5;146m \e[48;5;146m \e[48;5;146m \e[48;5;0m \e[48;5;0m \e[48;5;146m\e[38;5;110m▄\e[48;5;146m \e[48;5;146m \e[48;5;146m \e[0m
\e[48;5;68m\e[38;5;67m▄\e[48;5;68m \e[48;5;68m \e[48;5;68m \e[48;5;68m \e[48;5;110m\e[38;5;104m▄\e[48;5;110m \e[48;5;110m \e[48;5;110m \e[48;5;110m \e[48;5;110m \e[48;5;110m \e[48;5;110m \e[48;5;110m \e[48;5;110m \e[48;5;110m \e[48;5;110m \e[48;5;110m \e[48;5;110m \e[48;5;110m \e[48;5;110m \e[48;5;110m \e[48;5;110m \e[48;5;110m \e[48;5;110m \e[48;5;110m \e[48;5;110m\e[38;5;0m▄\e[48;5;0m \e[48;5;0m \e[48;5;110m \e[48;5;110m \e[48;5;146m\e[38;5;110m▄\e[48;5;146m\e[38;5;110m▄\e[48;5;147m\e[38;5;0m▄\e[48;5;0m \e[48;5;0m\e[38;5;110m▄\e[48;5;110m \e[48;5;110m \e[48;5;146m\e[38;5;110m▄\e[48;5;146m\e[38;5;110m▄\e[0m
\e[48;5;0m \e[48;5;68m \e[48;5;68m \e[48;5;68m \e[48;5;68m \e[48;5;68m \e[48;5;68m \e[48;5;110m\e[38;5;68m▄\e[48;5;110m \e[48;5;110m \e[48;5;110m \e[48;5;110m \e[48;5;110m \e[48;5;110m \e[48;5;110m \e[48;5;110m \e[48;5;110m \e[48;5;110m \e[48;5;110m \e[48;5;110m \e[48;5;110m \e[48;5;110m \e[48;5;110m \e[48;5;110m\e[38;5;0m▄\e[48;5;110m\e[38;5;0m▄\e[48;5;0m \e[48;5;0m \e[48;5;0m\e[38;5;110m▄\e[48;5;110m \e[48;5;110m \e[48;5;110m \e[48;5;110m \e[48;5;110m\e[38;5;0m▄\e[48;5;0m \e[48;5;0m\e[38;5;109m▄\e[48;5;110m \e[48;5;110m \e[48;5;110m \e[48;5;110m \e[48;5;0m \e[0m
\e[48;5;0m \e[48;5;0m \e[48;5;0m \e[48;5;0m \e[48;5;0m \e[48;5;0m \e[48;5;0m \e[48;5;0m \e[48;5;0m \e[48;5;0m \e[48;5;0m \e[48;5;0m \e[48;5;0m \e[48;5;0m \e[48;5;0m \e[48;5;0m \e[48;5;0m \e[48;5;0m \e[48;5;0m \e[48;5;0m \e[48;5;0m \e[48;5;0m \e[48;5;0m \e[48;5;0m\e[38;5;103m▄\e[48;5;0m\e[38;5;110m▄\e[48;5;0m\e[38;5;110m▄\e[48;5;110m \e[48;5;110m \e[48;5;110m \e[48;5;110m \e[48;5;110m \e[48;5;147m\e[38;5;0m▄\e[48;5;0m \e[48;5;0m\e[38;5;110m▄\e[48;5;110m \e[48;5;110m \e[48;5;110m \e[48;5;110m \e[48;5;109m\e[38;5;0m▄\e[48;5;0m \e[0m
\e[48;5;0m \e[48;5;0m \e[48;5;0m \e[48;5;68m \e[48;5;68m \e[48;5;68m \e[48;5;68m \e[48;5;68m \e[48;5;68m \e[48;5;74m\e[38;5;68m▄\e[48;5;110m\e[38;5;68m▄\e[48;5;110m\e[38;5;104m▄\e[48;5;110m \e[48;5;110m \e[48;5;110m \e[48;5;110m \e[48;5;110m \e[48;5;110m \e[48;5;110m \e[48;5;110m \e[48;5;110m \e[48;5;110m \e[48;5;110m \e[48;5;110m \e[48;5;110m \e[48;5;110m \e[48;5;110m \e[48;5;110m \e[48;5;110m\e[38;5;147m▄\e[48;5;110m\e[38;5;0m▄\e[48;5;0m \e[48;5;0m\e[38;5;104m▄\e[48;5;0m\e[38;5;110m▄\e[48;5;110m \e[48;5;110m \e[48;5;110m \e[48;5;110m \e[48;5;73m\e[38;5;0m▄\e[48;5;0m \e[48;5;0m \e[0m
\e[48;5;0m \e[48;5;0m \e[48;5;0m \e[48;5;0m \e[48;5;68m\e[38;5;0m▄\e[48;5;68m \e[48;5;68m \e[48;5;68m \e[48;5;68m \e[48;5;68m \e[48;5;68m \e[48;5;68m \e[48;5;68m \e[48;5;110m\e[38;5;68m▄\e[48;5;110m\e[38;5;104m▄\e[48;5;110m \e[48;5;110m \e[48;5;110m \e[48;5;110m \e[48;5;110m \e[48;5;110m \e[48;5;110m \e[48;5;110m \e[48;5;110m \e[48;5;110m\e[38;5;109m▄\e[48;5;110m\e[38;5;0m▄\e[48;5;110m\e[38;5;0m▄\e[48;5;0m \e[48;5;0m \e[48;5;0m\e[38;5;110m▄\e[48;5;0m\e[38;5;110m▄\e[48;5;110m \e[48;5;110m \e[48;5;110m \e[48;5;110m \e[48;5;110m\e[38;5;0m▄\e[48;5;0m \e[48;5;0m \e[48;5;0m \e[48;5;0m \e[0m
\e[48;5;0m \e[48;5;0m \e[48;5;0m \e[48;5;0m \e[48;5;0m \e[48;5;0m \e[48;5;0m \e[48;5;0m \e[48;5;0m \e[48;5;0m \e[48;5;0m \e[48;5;0m \e[48;5;0m \e[48;5;0m \e[48;5;0m \e[48;5;0m \e[48;5;0m \e[48;5;0m \e[48;5;0m \e[48;5;0m \e[48;5;0m \e[48;5;0m \e[48;5;0m \e[48;5;0m \e[48;5;0m \e[48;5;0m\e[38;5;110m▄\e[48;5;0m\e[38;5;110m▄\e[48;5;105m\e[38;5;110m▄\e[48;5;110m \e[48;5;110m \e[48;5;110m \e[48;5;110m \e[48;5;110m \e[48;5;110m\e[38;5;0m▄\e[48;5;103m\e[38;5;0m▄\e[48;5;0m \e[48;5;0m \e[48;5;0m \e[48;5;0m \e[48;5;0m \e[0m
\e[48;5;0m \e[48;5;0m \e[48;5;0m \e[48;5;0m \e[48;5;0m \e[48;5;0m \e[48;5;0m \e[48;5;0m \e[48;5;0m \e[48;5;68m\e[38;5;67m▄\e[48;5;68m \e[48;5;68m \e[48;5;68m \e[48;5;74m\e[38;5;68m▄\e[48;5;74m\e[38;5;68m▄\e[48;5;74m\e[38;5;68m▄\e[48;5;74m\e[38;5;68m▄\e[48;5;74m\e[38;5;68m▄\e[48;5;110m\e[38;5;68m▄\e[48;5;110m\e[38;5;68m▄\e[48;5;110m\e[38;5;68m▄\e[48;5;110m \e[48;5;110m \e[48;5;110m \e[48;5;110m \e[48;5;110m \e[48;5;110m \e[48;5;110m \e[48;5;110m \e[48;5;110m \e[48;5;110m\e[38;5;103m▄\e[48;5;110m\e[38;5;0m▄\e[48;5;0m \e[48;5;0m \e[48;5;0m \e[48;5;0m \e[48;5;0m \e[48;5;0m \e[48;5;0m \e[48;5;0m \e[0m
\e[48;5;0m \e[48;5;0m \e[48;5;0m \e[48;5;0m \e[48;5;0m \e[48;5;0m \e[48;5;0m \e[48;5;0m \e[48;5;0m \e[48;5;0m \e[48;5;0m \e[48;5;74m\e[38;5;0m▄\e[48;5;68m\e[38;5;0m▄\e[48;5;68m\e[38;5;0m▄\e[48;5;68m\e[38;5;67m▄\e[48;5;68m \e[48;5;68m \e[48;5;68m \e[48;5;68m \e[48;5;68m \e[48;5;68m \e[48;5;68m \e[48;5;104m\e[38;5;68m▄\e[48;5;110m\e[38;5;104m▄\e[48;5;110m\e[38;5;104m▄\e[48;5;110m\e[38;5;67m▄\e[48;5;110m\e[38;5;0m▄\e[48;5;110m\e[38;5;0m▄\e[48;5;110m\e[38;5;0m▄\e[48;5;0m \e[48;5;0m \e[48;5;0m \e[48;5;0m \e[48;5;0m \e[48;5;0m \e[48;5;0m \e[48;5;0m \e[48;5;0m \e[48;5;0m \e[48;5;0m \e[0m
';
echo 
echo "DYSTEM - Masternode installer ${VERSION}"
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
	sudo apt-get -y install build-essential libtool autotools-dev automake pkg-config libssl-dev libssl-dev libgmp3-dev libevent-dev bsdmainutils libboost-all-dev libdb4.8-dev libdb4.8++-dev libminiupnpc-dev libzmq5 libboost-system1.58-dev libboost-system1.58.0 libboost-filesystem1.58-dev libboost-filesystem1.58.0 libboost-program-options-dev libboost-all-dev libdb4.8-dev libdb4.8++-dev libminiupnpc-dev libevent-pthreads-2.0-5

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
	echo "We are now going to setup your masternodes…"

  total_masternodes=""
  re='^[0-3]+$'
  while ! [[ $total_masternodes =~ $re ]] ; do
    echo ""
    echo "How many masternodes would you like to setup on this server?, note this is restricted to 3 as it is not recommnded to run more than 3 masternodes on a single server. type 1, 2 or 3 followed by [ENTER]:"
    read total_masternodes
  done

  for i in `seq 1 1 $total_masternodes`; do
    echo
      echo "Please enter the 'masternode private key' for masternode ${i} followed by [ENTER]:"
      read MN_PRIVATE_KEY

      let "realtive_port=65442 + ${i}"
      echo "The port for this masternode is:"
      echo $realtive_port
      install_dir="~/${CONF_DIR}${i}"

      #Write config to config file
      mkdir -p $install_dir
      cd $install_dir
      touch $CONF_FILE

      echo '#!/bin/bash' > ~/bin/dystemd${i}.sh
      echo "dystemd -daemon -conf=${install_dir}/dystem.conf "'$*' >> ~/bin/dystemd${i}.sh
      echo '#!/bin/bash' > ~/bin/dystem-cli${i}.sh
      echo "dystem-cli -conf=${install_dir}/dystem.conf "'$*' >> ~/bin/dystem-cli${i}.sh
      echo '#!/bin/bash' > ~/bin/dystem-tx${i}.sh
      echo "dystem-tx -conf=${install_dir}/dystem.conf "'$*' >> ~/bin/dystem-tx${i}.sh
      chmod 755 ~/bin/dystem*.sh
     
      touch dystem.conf_TEMP
      echo "rpcuser=dtem"`shuf -i 100000-10000000 -n 1` >> dystem.conf_TEMP
      echo "rpcpassword="`shuf -i 100000-10000000 -n 1` >> dystem.conf_TEMP
      echo "rpcallowip=127.0.0.1" >> dystem.conf_TEMP
      echo "rpcport=17100" >> dystem.conf_TEMP
      echo "listen=1" >> dystem.conf_TEMP
      echo "server=1" >> dystem.conf_TEMP
      echo "daemon=1" >> dystem.conf_TEMP
      echo "masternode=1" >> dystem.conf_TEMP
      echo "masternodeaddr=$(hostname  -I | cut -f1 -d' '):$realtive_port" >> dystem.conf_TEMP
      echo "masternodeprivkey=$MN_PRIVATE_KEY" >> dystem.conf_TEMP
      echo "maxconnections=256" >> dystem.conf_TEMP
      echo "port=${realtive_port}" >> dystem.conf_TEMP
      echo "addnode=45.32.236.168" >> dystem.conf_TEMP
      echo "addnode=45.76.251.25" >> dystem.conf_TEMP
      echo "addnode=149.28.146.122" >> dystem.conf_TEMP
      
      mv dystem.conf_TEMP dystem.conf

      sh ~/bin/dystemd${i}.sh

      cd ../
  done

      sudo rm -rdf "/root/bin"
      sudo rm -f "/root/mnbin.tar.gz"
      sudo rm -f "/root/mn_install.sh"

      echo "Enjoy your masternode rewards! Now if you could get the developers a nice cup of coffee, or tea... perhaps a beer ?"
fi 
