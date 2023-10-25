# Introduction 
Files and templates to create an automated ICS simulation environment for exploration and learning.  
This environment is based on the following sources:  
+ https://openplcproject.github.io/
+ https://dial.uclouvain.be/memoire/ucl/fr/object/thesis%3A14706/datastream/PDF_01/view  
+ https://rodrigocantera.com/en/virtual-industrial-cybersecurity-part-0-road-to-virtualization/  
+ Pascal Ackerman, Industrial Cybersecurity - Second Edition - https://www.packtpub.com/product/industrial-cybersecurity-second-edition/9781800202092  

Tools onclude Mininet, openPLC, PySCADA, ScadaBR, and more

The project aims to leverage the Azure pipeline features for automated deployment
  

# Steps
Write pipeline for:
1. Network deploy 10.0.0.0/8  
    + Bastion:    10.0.0.0/28  
    + Purdue L0:  10.0.10.0/24  
    + Purdue L1:  10.0.11.0/24  
    + Purdue L2:  10.0.12.0/24  
    + Purdue L3:  10.0.13.0/24  
    + Purdue L3.5:10.0.1.0/28  
    + Purdue L4:  192.168.14.0/24  
2. Bastion Deploy 10.0.0.0/28
3. Ubuntu server PLC deploy 10.0.11.0/24
4. Ubuntu server SCADA deploy 10.0.12.0/24
5. Windows workstation ENGINEERING deploy 10.0.13.0/24

# Build
## Build simulation:
1. Deploy OpenPLC on the ubuntu vmPLC
    https://github.com/thiagoralves/OpenPLC_v3
    >sudo apt update  
    >sudo apt install -y git
    >sudo apt install python   
    >mkdir ICS  
    >cd ./ICS  
    >git clone https://github.com/thiagoralves/OpenPLC_v3.git  
    >cd ./OpenPLC_v3  
    >./install.sh linux  

    OpenPLC status:  
    sudo systemctl status openplc  

    webserver: <IP>:8080  

2. Install OpenPLC Editor on ENG workstation
3. ~~Install mininet om Ubuntu vmPLC~~  
    http://mininet.org/download/  
    >git clone https://github.com/mininet/mininet  
    >mininet/util/install.sh -s ./mininet -a  
    test functionality:  
    >sudo mn --switch ovsbr --test pingall  

4. Deploy ScadaBR on the ubuntu vmSCADA
    https://openplcproject.github.io/reference/scadabr/
    >sudo apt update  
    >sudo apt instal -y git iputils-ping  
    >git clone https://github.com/thiagoralves/ScadaBR_Installer.git  
    >cd ScadaBR_Installer  
    >sudo ./install_scadabr.sh  


## Test:
1. connect to OpenPLC webserver from ENGINEERING workstation  
    $IP:8080  
    user: openplc  
    password: openplc  
2. connect to ScadaBR webserver  
    $IP:9090/ScadaBR  
    user: admin  
    password: admin  
