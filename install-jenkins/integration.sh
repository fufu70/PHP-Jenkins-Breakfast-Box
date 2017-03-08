#!/bin/bash
sudo wget http://localhost:8080/jnlpJars/jenkins-cli.jar

echo -n "What is your Jenkins username: "

read J_USERNAME

echo -n "What is your Jenkins password: "

read -s J_PASSWORD
echo

echo -n "Do you have a git repo?[y/N]: "

read HAS_GIT_REPO

if [ "$HAS_GIT_REPO" == "y" ]; then
	echo -n "HTTPS url to the repo: "

	read GIT_REPO_URL

	sudo sed -i "s,https://github.com/fufu70/deadbody-php,$GIT_REPO_URL,g" ~/install-jenkins/data/config.xml
fi

sudo cat ~/install-jenkins/data/config.xml | \
     java -jar jenkins-cli.jar -s http://localhost:8080 create-job php-breakfast-job  --username "$J_USERNAME" --password "$J_PASSWORD"

sudo java -jar jenkins-cli.jar -s http://localhost:8080 reload-configuration  --username "$J_USERNAME" --password "$J_PASSWORD"