#Install chocolatey https://chocolatey.org/install
Set-ExecutionPolicy AllSigned; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))

#Install Vagrant https://chocolatey.org/packages/vagrant
choco install vagrant -y

#Install virtualbox https://chocolatey.org/packages/virtualbox
choco install virtualbox

#Install git
choco install git.install/GitAndUnixToolsOnPath /WindowsTerminal

#Install Ansible VM
git clone https://github.com/davidobrien1985/vagrant_ansible.git
cd vagrant_ansible
Vagrant up
