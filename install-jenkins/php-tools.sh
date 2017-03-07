#!/bin/bash
# Install php tools necessary for jenkins
sudo apt-get -y install php5 php5-curl php5-mcrypt

# Install Composer
sudo curl -sS https://getcomposer.org/installer | php
sudo mv composer.phar /usr/local/bin/composer
sudo chown -hR vagrant:vagrant ~/
sudo sed -i '1i export PATH="$HOME/.composer/vendor/bin:$PATH"' $HOME/.bashrc
source $HOME/.bashrc

# Install php5-xsl for PHPDox
sudo apt-get -y install php5-xsl
sudo php5enmod xsl
sudo service apache2 restart

# Install php5-xdebug
sudo apt-get -y install php5-xdebug

# Install PEAR and PHP_CodeSniffer
curl -OL https://squizlabs.github.io/PHP_CodeSniffer/phpcs.phar
sudo chmod +x phpcs.phar
sudo mv phpcs.phar /usr/local/bin/phpcs

curl -OL https://squizlabs.github.io/PHP_CodeSniffer/phpcbf.phar
sudo chmod +x phpcbf.phar
sudo mv phpcbf.phar /usr/local/bin/phpcbf

# Install PHP Unit
wget https://phar.phpunit.de/phpunit-4.8.phar
sudo chmod +x phpunit-4.8.phar
sudo mv phpunit-4.8.phar /usr/local/bin/phpunit

# Install PHPLOC
sudo wget https://phar.phpunit.de/phploc.phar
sudo chmod +x phploc.phar
sudo mv phploc.phar /usr/local/bin/phploc

# Install PDepend
sudo wget http://static.pdepend.org/php/latest/pdepend.phar
sudo chmod +x pdepend.phar
sudo mv pdepend.phar /usr/local/bin/pdepend

# Install PHPMD
sudo wget -c http://static.phpmd.org/php/latest/phpmd.phar
sudo chmod +x phpmd.phar
sudo mv phpmd.phar /usr/local/bin/phpmd

# Install PHPCPD
sudo wget https://phar.phpunit.de/phpcpd-2.0.4.phar
sudo chmod +x phpcpd-2.0.4.phar
sudo mv phpcpd-2.0.4.phar /usr/local/bin/phpcpd

# Install PHPDox
sudo wget http://phpdox.de/releases/phpdox.phar
sudo chmod +x phpdox.phar
sudo mv phpdox.phar /usr/local/bin/phpdox