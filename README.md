# Jenkins-Breakfast-Box

I sit in my pajamas with an hour before work starts and all I want to do is setup a basic Jenkins server for my php project so that I can analyze the kerfluffle out of it. Screw waisting time figuring out how to setup a [chef server](https://github.com/pietervogelaar/chef-cookbook-jenkins-server) or [anisble away](https://github.com/HanXHX/ansible-jenkins-php) just to figure out what the [CRAP](http://www.crap4j.org/faq.html) is going on with my codebase. All I want is to input some commands to install and update my php jenkins box while eating some delicious php [pancakes](https://raw.githubusercontent.com/fufu70/jenkins-php-box/master/common/pancakes.jpg).

## The requirements

You thought that this was just going to be a Download And Analyze (DAA) project, but you are mistaken! To run the jenkins breakfast box we still need to install some dependencies:

* [VirtualBox](https://www.virtualbox.org/wiki/Downloads)
  * Make sure to download the latest version, even if you already installed VirtualBox before.
  * As of writing this my version (AOWTMV) is 5.1.14
* [Vagrant](https://www.vagrantup.com/downloads.html)
  * AOWTMV is 1.8.6
* [A Computer](http://i.giphy.com/xTiTnJ3BooiDs8dL7W.gif)

## The process

To run the breakfast box simply go to your terminal, clone the repository, and run vagrant up:

```shell
$ git clone https://github.com/fufu70/jenkins-php-box
$ vagrant up
```

After the breakfast box "up"s it will give some instructions as to what to do next:

> You Installed and updated jenkins ... YAY! Now run 'vagrant ssh', and in the '/home/vagrant/' dir go to run 'sudo bash install-jenkins/install.sh'

Dont tell me what to do Vagrant! Im my own well adgusted programmer! I know what i'll do:

```shell
$ vagrant ssh
$ sudo bash ~/install-jenkins/install.sh
```

Yea! I dont need no program telling me what to do ...

> Ok! So now go to your browser and view this IP address at port http://192.168.205.20:8080 and setup your jenkins machine

What is this! More [instructions!](http://i.giphy.com/X7jENDat6V5Je.gif)

After you make your own goddam decisions you adult you'll see a screen that requests you Unlock Jenkins
![alt text][unlock-jenkins]

All you need to do is run

```shell
$ sudo cat /var/lib/jenkins/secrets/initialAdminPassword
```

And copy and paste get the password shown on screen.

You then come up to a screen that requests you to Customize Jenkins, choose the highlighted "Install suggested plugins" option
![alt text][customize-jenkins]

Afterwards it will install a list of generalized selection of plugins
![alt text][plugins-installing-jenkins]

Once all fo the plugins arre finished installing we will go to setting up the first admin user, dont forget your username and password, we'll need it later.
![alt text][admin-user-jenkins]

JENKINS IS INSTALLED!~!~!~ 
![alt text][installed-jenkins]

Now we go back to our handy dandy terminal to run some more [commands](http://i.giphy.com/JIX9t2j0ZTN9S.gif)

U should still be in the vagrant machines shell, if not run:

```shell
$ vagrant ssh
```

OK! So all we gotta do is run 3 more commands and we should be done with shell. These commands go to install some more [php specific plugins](https://github.com/fufu70/jenkins-php-box/blob/master/install-jenkins/plugins.sh), local [php tools](https://github.com/fufu70/jenkins-php-box/blob/master/install-jenkins/php-tools.sh) that the plugins will interface with, and [create a job](https://github.com/fufu70/jenkins-php-box/blob/master/install-jenkins/integration.sh) to combine these plugins together.

The first command will be the the php tools installation.

```shell
$ sudo bash ~/install-jenkins/php-tools.sh
```

Then install the plugins to integrate with your tools. You will need to use your username and password for jenkins as it will connect with jenkins through a jenkins-cli.jar

```shell
$ sudo bash ~/install-jenkins/plugins.sh
```

Once all of the plugins have been installed we want to be able to actually create a jobbo! Dont forget your username and password.

```shell
$ sudo bash ~/install-jenkins/integration.sh
```

Your done now, you should be anyways, When you go back to your running jenkins instance you should see your job just hanging out, php-breakfast. 

Ok, your work alarm has [rung](http://i.giphy.com/Tohtjw8GoSmpa.gif)! Get back to your [Hacking](http://i.giphy.com/MGaacoiAlAti0.gif) you filthy developer!

## Background Information

A basic jenkins environment for PHP codebases strictly for ubuntu-14.04. Its not fully automatic but is an aid in starting up the project simply using shell scripts to guide you along the way.

## Thanks to:

Sebastian Bergmann for creating the [Template for Jenkins Jobs for PHP Projects](http://jenkins-php.org/index.html)

Shrek for making it all [happen](http://i.giphy.com/soVPwjAd33L5m.gif)

[unlock-jenkins]: https://raw.githubusercontent.com/fufu70/jenkins-php-box/master/common/unlock-jenkins.png "Unlock Jenkins"
[customize-jenkins]: https://raw.githubusercontent.com/fufu70/jenkins-php-box/master/common/customize-jenkins.png "Customize Jenkins"
[plugins-installing-jenkins]: https://raw.githubusercontent.com/fufu70/jenkins-php-box/master/common/plugins-installing-jenkins.png "Plugins Installing"
[admin-user-jenkins]: https://raw.githubusercontent.com/fufu70/jenkins-php-box/master/common/admin-user-jenkins.png "Admin User Creation"
[installed-jenkins]: https://raw.githubusercontent.com/fufu70/jenkins-php-box/master/common/installed-jenkins.png "Jenkins is installed"
