#1. https://chocolatey.org/install
   Set-ExecutionPolicy AllSigned; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
#2. https://chocolatey.org/packages/vagrant
   choco install vagrant -y
#3. https://chocolatey.org/packages/virtualbox
   choco install virtualbox
#Install git
   choco install git.install/GitAndUnixToolsOnPath /WindowsTerminal
#4. https://app.vagrantup.com/ubuntu/boxes/xenial64
   vagrant init ubuntu/xenial64

git clone https://github.com/davidobrien1985/vagrant_ansible.git
cd vagrant_ansible
Vagrant up


https://app.vagrantup.com/centos/boxes/7
