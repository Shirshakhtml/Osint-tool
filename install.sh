#!/bin/bash
echo "[+] Sit back and relax till this installation finishes"
sleep 2
sudo apt install figlet;
sudo apt install toilet;
apt install golang;
apt install nmap;
apt install sublist3r
sleep 2
echo "[+] Installing Go tools..."
go install github.com/tomnomnom/assetfinder@latest
sleep 2
go install github.com/tomnomnom/httprobe@latest
sleep 4
go install -v github.com/projectdiscovery/httpx/cmd/httpx@latest
sleep 2
echo "[+] Transferring the Go binaries to /usr/bin"

sleep 2

echo "Done"
