# -*- mode: ruby -*-
# vi: set ft=ruby :

JENKINS_SCRIPT = <<EOF.freeze
echo "Preparing node..."

# ensure the time is up to date
apt-get update
apt-get -y install git
apt-get -y install ant
apt-get -y install ntp
service ntp stop
ntpdate -s time.nist.gov
service ntp start

# setup jenkins for installation
wget -q -O - http://pkg.jenkins-ci.org/debian-stable/jenkins-ci.org.key | sudo apt-key add -
sh -c 'echo deb http://pkg.jenkins-ci.org/debian-stable binary/ > /etc/apt/sources.list.d/jenkins.list'
apt-get -y update

echo "You Installed the PHP-Jenkins-Breakfast-Box ... YAY! Run 'vagrant ssh', and 'sudo bash ~/install-jenkins/install.sh'"

EOF

def set_hostname(server)
  server.vm.provision 'shell', inline: "hostname #{server.vm.hostname}"
end
Vagrant.configure("2") do |config|
  config.vm.define 'php-jenkins-breakfast-box' do |n|
    n.vm.box = 'bento/ubuntu-14.04'
    n.vm.hostname = 'php-jenkins-breakfast-box'
    n.vm.network 'private_network', ip: '192.168.205.20'
    n.vm.provision :shell, inline: JENKINS_SCRIPT.dup
    n.vm.synced_folder "install-jenkins/", "/home/vagrant/install-jenkins", owner: "vagrant", group: "vagrant"
    set_hostname(n)
  end
end