#! /bin/bash
if test -z `whitch docker` then
	echo "install docker" && exit
fi
sudo apt-get update 
sudo apt-get install -y git nodejs build-essential python2.7
git clone "https://github.com/cjdelisle/cjdns" || (echo "error cloning project" && exit)
cd cjdns && sudo docker build .
