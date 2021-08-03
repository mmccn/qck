# Since this script is already written and maintained, we are just calling a curl command to execute this script.

if [ which curl &> /dev/null ]
then	
	OS_VERSION = grep '^ID_LIKE' /etc/os-release
	if [ OS_VERSION == *"ubuntu"* ] || [ OS_VERSION == *"debian"* ]
	then
		echo "Detected debian-based install, installing CURL"
		sudo apt install curl
	else
		echo "Please install CURL then re-run this script!"
	fi
fi

echo "Installing Node (LTS Release)"
echo "NOTE: This requires root privileges"
if [[ ( -n "$DEBUG" ) ||( "$DEBUG" != true) ]]
then
	curl -sfLS install-node.vercel.app/lts | sudo bash
else
	echo "Debug mode activated, not calling install script"
fi
