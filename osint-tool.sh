#!/bin/bash
Red=$'\e[1;31m'
Green=$'\e[1;32m'
Blue=$'\e[1;34m'
CYAN=$'\033[96m'
YELLOW=$'\033[93m'
PURPLE=$'\033[95m'

if [ -z "$1" ]
  then
    echo "No argument supplied....." $Green "Put a domain name and not a Subdomain Please!!"
else


rm domains.txt alive.json alive.txt domains.json domainswithstatuscode.txt whois.txt
#toilet -f big -F gay O3Int-t00l
toilet -f future --filter border:metal 'O3Int-t00l'
echo "Cleaning the previous files..."
echo $Green "Checking whois info....."
whois --verbose $1 > whois.txt
sleep 5 
echo "Printing it to whois.txt"
whois --verbose -d $1 >> whois.txt
sleep 3

echo $PURPLE "Checking for DKIM, SPF and DMARC Records" 
sleep 3


echo "DMARC Records"   
dig $YELLOW TXT _dmarc.$1
sleep 5
echo $Blue "Going to MX Toolbox.."
firefox --new-tab "https://mxtoolbox.com/SuperTool.aspx?action=dmarc%3a$1&run=toolpage" &
echo $Red "If no DMARC record then try and send mail from https://emkei.cz "
echo $Red "If you are able to send mail then the domain is vulnerable and you may get Hall of Fame if this vulnerability is in scope"
sleep 2
echo "SPF Records"
dig $YELLOW TXT google._domainkey.$1
sleep 5
echo $Blue "Going to MX Toolbox.."
firefox --new-tab "https://mxtoolbox.com/SuperTool.aspx?action=spf%3a$1&run=toolpage" &
sleep 2
echo "DKIM Records"
dig $YELLOW TXT $1
sleep 5
echo $Blue "Going to MX Toolbox.."
firefox --new-tab "https://mxtoolbox.com/SuperTool.aspx?action=dkim%3a$1%3agoogle&run=toolpage#" &

echo "Subdomain enumeration will be starting in 10 sec.."
sleep 10

echo "Your enumerated domains is saving in domains.txt ..."
sublist3r -d $1 -v -o domains.txt

~/go/bin/assetfinder --subs-only $1 >> domains.txt

sort -u domains.txt -o domains.txt

echo "[+] Checking for alive domains.. saving in alive.txt"
cat domains.txt | ~/go/bin/httprobe | tee -a alive.txt
cat alive.txt | ~/go/bin/httpx -sc | tee -a domainswithstatuscode.txt
#Data to json
cat alive.txt | python -c "import sys; import json; print (json.dumps({'domains':list(sys.stdin)}))" > alive.json
cat domains.txt | python -c "import sys; import json; print (json.dumps({'domains':list(sys.stdin)}))" > domains.json
echo $YELLOW "Lastly, we would search for open ports"
echo "Running NMAP so may take some time. Totally depends upon the number of subdomains we have, so sit back and relax"
sudo nmap -v -iL domains.txt -Pn --max-rate 10000 | tee open-ports
echo $CYAN "Happy" $YELLOW "to" $PURPLE "Automate"
fi
