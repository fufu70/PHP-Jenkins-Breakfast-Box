# PHP-Jenkins-Breakfast-Box

I'm sitting in my pajamas an hour before work starts. All I want is a Jenkins server for my PHP project to analyze the kerfluffle out of is fart box. Screw wasting time figuring out [Chef](https://github.com/pietervogelaar/chef-cookbook-jenkins-server) or [Anisble](https://github.com/HanXHX/ansible-jenkins-php). I just want to figure out what the [C.R.A.P.](http://www.crap4j.org/faq.html) is going on with my PHP: HP project. All I want is to input some commands, install my PHP: HP: HP jenkins box while eating some delicious PHPancakes.

![alt text][php-pancakes]

## The requirements

You thought that was a Download And Analyze (DAA) project, **but** you are mistaken! To run the PHP: HP: HP: HP-Jenkins-Breakfast-Box we need to install dependencies:

* [VirtualBox](https://www.virtualbox.org/wiki/Downloads)
  * Make sure to download the latest version, even if you already installed VirtualBox before.
  * As of writing this my version (AOWTMV) is 5.1.14
* [Vagrant](https://www.vagrantup.com/downloads.html)
  * AOWTMV is 1.8.6
* [A Computer](http://i.giphy.com/xTiTnJ3BooiDs8dL7W.gif)

## The process

To run the breakfast box go to your terminal, clone the repository, and run **vagrant up**:

```shell
$ git clone https://github.com/fufu70/jenkins-php-box
$ vagrant up
```

After the PHP: HP: HP: HP: HP-Jenkins-Breakfast-Box "up"s it will gives instructions on what to do:

> You Installed the PHP-Jenkins-Breakfast-Box ... YAY! Run 'vagrant ssh', and 'sudo bash ~/install-jenkins/install.sh'

Dont tell me what to do Vagrant! Im a [well adgusted programmer](http://i.giphy.com/VD9NtdBN9CwqQ.gif)! I know, i'll:

```shell
$ vagrant ssh
$ sudo bash ~/install-jenkins/install.sh
```

Yea! [I don't need no program telling me what to do ...](http://i.giphy.com/3o6ZtmMXFewRk4WKFG.gif)

> Ok! Go to your browser at [http://192.168.205.20:8080](http://192.168.205.20:8080) to setup your PHP-Jenkins-Breakfast-Box

What's this! More [instructions!](http://i.giphy.com/X7jENDat6V5Je.gif)

After you make your own goddam decisions [you adult](http://i.giphy.com/l0Iyf9vXAJFO7qVZS.gif) you'll see a screen that requests you Unlock Jenkins
![alt text][unlock-jenkins]

Run:

```shell
$ sudo cat /var/lib/jenkins/secrets/initialAdminPassword
```

Copy and paste the password shown after the command is run.

You then come up to a screen that requests you to Customize Jenkins, choose the highlighted "Install suggested plugins" option
![alt text][customize-jenkins]

Afterwards it will install a list of generalized selection of plugins
![alt text][plugins-installing-jenkins]

Once the plugins are installed create the [first](http://i.giphy.com/FYy1pE8KHCmc0.gif) admin user. Don't forget the username and password, we'll need it later.
![alt text][admin-user-jenkins]

JENKINS IS INSTALLED!~!~!~ 
![alt text][installed-jenkins]

Now we go back to our [handy dandy terminal](http://i.giphy.com/6edVpzX8cg41O.gif) to run more [commands](http://i.giphy.com/JIX9t2j0ZTN9S.gif)

U should still be in the [vagrant](http://www.fotothing.com/photos/a74/a74444e446de3816566011350e7eb4ca.jpg) machines shell, if not run:

```shell
$ vagrant ssh
```

OK! So all we gotta do is run 3 more commands and we should be done with shell. These commands go to install some more [php specific plugins](https://github.com/fufu70/jenkins-php-box/blob/master/install-jenkins/plugins.sh), local [php tools](https://github.com/fufu70/jenkins-php-box/blob/master/install-jenkins/php-tools.sh) that the plugins interface with, and [create a job](https://github.com/fufu70/jenkins-php-box/blob/master/install-jenkins/integration.sh) to connect with these plugins.

The first command will be php tools.

```shell
$ sudo bash ~/install-jenkins/php-tools.sh
```

Then install the plugins for the php tools. You will need a username and password for jenkins as it connects to the PHP-Jenkins-Breakfast-Box through a **jenkins-cli.jar**.

```shell
$ sudo bash ~/install-jenkins/plugins.sh
```

Once the plugins have been installed we want to actually create a [job!](http://i.giphy.com/RBDXLadJCxs6A.gif) Don't forget that username and password.

```shell
$ sudo bash ~/install-jenkins/integration.sh
```

When running this command you'll be given an option to input a personal repository. If **N** is selected then the repository URL can be changed from the config section of the jenkins job at [http://192.168.205.20:8080/job/php-breakfast-box-job/configure](http://192.168.205.20:8080/job/php-breakfast-box-job/configure). The second option below is the **Source Code Management** config, here you can set a repository url and credentials:

![alt text][integrate-repo-jenkins]

Your done now, you should be anyways, When you go back to your running jenkins instance you should see your job just hanging out, php-breakfast-box-job. 

Ok, your work alarm has [rung](http://i.giphy.com/Tohtjw8GoSmpa.gif)! Get back to your [Hacking](http://i.giphy.com/MGaacoiAlAti0.gif) you filthy developer!

## Background Information

A basic jenkins environment for PHP codebases strictly for ubuntu-14.04. Its not fully automatic but is an aid in starting up the project simply using shell scripts as a guide.

## Thanks to:

Sebastian Bergmann for creating the [Template for Jenkins Jobs for PHP Projects](http://jenkins-php.org/index.html)

Papa Johns for making it all [happen](http://static5.businessinsider.com/image/568ac02cc08a806f008b69d7-2400/rtr2u9g0.jpg)

[php-pancakes]: https://raw.githubusercontent.com/fufu70/jenkins-php-box/master/common/pancakes.jpg "PHP Pancakes"
[unlock-jenkins]: https://raw.githubusercontent.com/fufu70/jenkins-php-box/master/common/unlock-jenkins.png "Unlock Jenkins"
[customize-jenkins]: https://raw.githubusercontent.com/fufu70/jenkins-php-box/master/common/customize-jenkins.png "Customize Jenkins"
[plugins-installing-jenkins]: https://raw.githubusercontent.com/fufu70/jenkins-php-box/master/common/plugins-installing-jenkins.png "Plugins Installing"
[admin-user-jenkins]: https://raw.githubusercontent.com/fufu70/jenkins-php-box/master/common/admin-user-jenkins.png "Admin User Creation"
[installed-jenkins]: https://raw.githubusercontent.com/fufu70/jenkins-php-box/master/common/installed-jenkins.png "Jenkins is installed"
[integrate-repo-jenkins]: https://raw.githubusercontent.com/fufu70/jenkins-php-box/master/common/integrate-repo-jenkins.png "Integrate repository inside of Jenkins job"