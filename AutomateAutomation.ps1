#Install chocolatey https://chocolatey.org/install
Set-ExecutionPolicy AllSigned; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))

Install latest powershell and WMF (Windows Management Framework)
choco install powershell -y

#Install Vagrant https://chocolatey.org/packages/vagrant
choco install vagrant -y

#Install virtualbox https://chocolatey.org/packages/virtualbox
choco install virtualbox

#Install git
choco install git.install/GitAndUnixToolsOnPath /WindowsTerminal

#Create Ansible VM
git clone https://github.com/davidobrien1985/vagrant_ansible.git
cd vagrant_ansible
Vagrant up

#ssh ino new Ansible VM
vagrant ssh ansible

#Initialize Ansible
source ansible/hacking/env-setup
