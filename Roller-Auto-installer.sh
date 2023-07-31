
#!/bin/bash

echo "Still Preparing"
echo "=================================================="
echo -e "\033[0;35m"
echo " ░█████╗░░█████╗░███╗░░░███╗██╗░░░██╗███╗░░██╗██╗████████╗██╗░░░██╗░░░░░░███╗░░██╗░█████╗░██████╗░███████╗░██████╗";
echo " ██╔══██╗██╔══██╗████╗░████║██║░░░██║████╗░██║██║╚══██╔══╝╚██╗░██╔╝░░░░░░████╗░██║██╔══██╗██╔══██╗██╔════╝██╔════╝";
echo " ██║░░╚═╝██║░░██║██╔████╔██║██║░░░██║██╔██╗██║██║░░░██║░░░░╚████╔╝░█████╗██╔██╗██║██║░░██║██║░░██║█████╗░░╚█████╗░";
echo " ██║░░██╗██║░░██║██║╚██╔╝██║██║░░░██║██║╚████║██║░░░██║░░░░░╚██╔╝░░╚════╝██║╚████║██║░░██║██║░░██║██╔══╝░░░╚═══██╗";
echo " ╚█████╔╝╚█████╔╝██║░╚═╝░██║╚██████╔╝██║░╚███║██║░░░██║░░░░░░██║░░░░░░░░░██║░╚███║╚█████╔╝██████╔╝███████╗██████╔╝";
echo " ░╚════╝░░╚════╝░╚═╝░░░░░╚═╝░╚═════╝░╚═╝░░╚══╝╚═╝░░░╚═╝░░░░░░╚═╝░░░░░░░░░╚═╝░░╚══╝░╚════╝░╚═════╝░╚══════╝╚═════╝";
echo -e "\e[0m"
echo "=================================================="



sleep 2
# set vars
if [ ! $DENOM]; then
        read -p "Enter Denom: " Denom
        echo 'export Denom='$Denom >> $HOME/.bash_profile
fi

if [ ! $RollappID ]; then
        read -p "Enter RollappID: " RollappID
        echo 'export RollappID='$RollappID >> $HOME/.bash_profile
fi

echo '================================================='
echo -e "Your Rollup-ID: \e[1m\e[32m$Rollapp-ID\e[0m"
echo '================================================='
sleep 2

# Install rollapp
curl -L https://dymensionxyz.github.io/roller/install.sh | bash

#init rollup
echo '================================================='
echo -e "Init Rollapp"
echo '================================================='
sleep 2
roller config init --interactive

sleep 
#Register RollApp
roller register
sleep 15

read -p "Do you fund your wallet ballance? (yes/no) " yn
case $yn in 
	yes ) echo Greats please wait to run your rollup;;
	no ) echo exit....;
		exit;;
	* ) echo invalid response;
		exit 1;;
esac

echo Run RollApp
#Run RollApp
roller run

