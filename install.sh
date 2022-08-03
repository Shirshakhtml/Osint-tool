#!/bin/bash
echo "[+] Sit back and relax till this installation finishes."

sleep 2

if [ ! -f /bin/figlet ];then
	sudo apt install figlet -y;
fi

if [ ! -f /bin/toilet ];then
	sudo apt install toilet -y;
fi

if [ ! -f /bin/go ];then
	sudo apt install golang -y;
fi

if [ ! -f /bin/nmap ];then
	sudo apt install nmap -y;
fi

if [ ! -f /bin/sublist3r ];then
	sudo apt install sublist3r -y;
fi

sleep 2

echo "[+] Installing Go tools..."
if [ ! -f /bin/assetfinder ]; then
	go install github.com/tomnomnom/assetfinder@latest
fi

sleep 2

if [ ! -f /bin/httprobe ]; then
	go install github.com/tomnomnom/httprobe@latest
fi

sleep 4

if [ ! -f /bin/httpx ]; then
	go install -v github.com/projectdiscovery/httpx/cmd/httpx@latest
fi

sleep 2
echo "[+] Configuring requirements."

#$HOME/go/bin
sudo cp $HOME/go/bin/httprobe /usr/bin
sudo cp $HOME/go/bin/assetfinder /usr/bin
sudo cp $HOME/go/bin/httpx /usr/bin

sleep 2

echo "[+] Setup completed"
