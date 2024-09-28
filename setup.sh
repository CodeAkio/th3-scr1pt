sudo apt update
sudo apt full-upgrade -y
sudo apt install docker.io docker-compose
sudo apt install golang jython seclists feroxbuster zaproxy sublist3r nuclei ffuf gobuster dirsearch ssh-audit openssh-client -y
sudo go install -v github.com/tomnomnom/anew@latest && sudo cp /root/go/bin/anew /usr/bin/
sudo go install -v github.com/projectdiscovery/httpx/cmd/httpx@latest && sudo cp /root/go/bin/httpx /usr/bin/
sudo go install -v github.com/tomnomnom/gf@latest && sudo cp /root/go/bin/gf /usr/bin/
sudo go install -v github.com/webklex/wappalyzer@main && sudo cp /root/go/bin/wappalyzer /usr/bin/
sudo go install -v github.com/ropnop/kerbrute@latest && sudo cp /root/go/bin/kerbrute /usr/bin