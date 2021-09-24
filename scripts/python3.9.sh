# Since this script is already written and maintained, we are just calling a curl command to execute this script.

if [ which curl &> /dev/null ]
then	
	OS_VERSION = grep '^ID_LIKE' /etc/os-release
	if [ OS_VERSION == *"ubuntu"* ] || [ OS_VERSION == *"debian"* ]
	then
		echo "Detected debian-based install, installing wget"
		sudo apt install wget make tar
	else
		echo "Please install wget, make, and tar then re-run this script!"
	fi
fi

echo "Installing Python 3.9.6"
echo "NOTE: This requires root privileges"
if [[ ( -n "$DEBUG" ) ||( "$DEBUG" != true) ]]
then
	curl -P ~/.qck/ https://www.python.org/ftp/python/3.9.6/Python-3.9.6.tgz
	cd ~/.qck/
	tar xzf Python-3.9.6
	cd Python-3.9.6
	./configure
	make
	sudo make install
else
	echo "Debug mode activated, not calling install script"
fi
