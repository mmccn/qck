echo "Installing Python 3.8"
echo "NOTE: This requires root privileges"
if [[ ( -n "$DEBUG" ) ||( "$DEBUG" != true) ]]
then
	sudo apt install python3.8 python3.8-dev python3.8-venv 
else
	echo "Debug mode activated, not calling install script"
fi
