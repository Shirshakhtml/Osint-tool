#!/usr/bin

echo "[+] Sit back and relax till this installation finishes"
sleep 2
sudo apt install toilet figlet golang sublist3r nmap

sleep 2

echo "[+] Installing Go tools..."

go install github.com/tomnomnom/assetfinder@latest

sleep 2

go install github.com/tomnomnom/httprobe@latest

sleep 4

go install -v github.com/projectdiscovery/httpx/cmd/httpx@latest

sleep 2

echo "[+] Transferring the Go binaries to /usr/bin"

sudo cp /home/kali/go/bin/httpx /usr/bin

sleep 2

sudo cp /home/kali/go/bin/httprobe /usr/bin

sleep 2

sudo cp /home/kali/go/bin/assetfinder /usr/bin