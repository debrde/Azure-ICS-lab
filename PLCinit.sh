#!/bin/bash
#filename       :PLCinit.sh
#description    :bash script to deploy basic packages on PLC vm after first deployment
#author         :De Braekeler Dennis
#date           :20231023
#
#notes          :run as root..
#
# =============================================================================

# update packages
apt-get update
echo "repo's updated"

# install basic packages (python3, git)
    #TO-DO: add check to verify if the package has already been deployed
yes|apt-get install iputils-ping
yes|apt-get install python3
yes|apt-get install git
echo "installed python3 and git"

# install OpenPLC package
cd ~
mkdir ICS
cd ./ICS  
git clone https://github.com/thiagoralves/OpenPLC_v3.git  
cd ./OpenPLC_v3  
./install.sh linux  
echo "openPLC installed"
#TO-DO initalize OpenPLC installation

# install mininet package
#cd ~/ICS/
#git clone https://github.com/mininet/mininet
#./mininet/util/install.sh -s ~/ICS/mininet -a
yes|apt-get install mininet #quick and easy way
#TO-DO: initialize and configure mininet