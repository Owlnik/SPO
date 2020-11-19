#! /bin/bash
sudo apt-get update 
sudo apt-get install -y git nodejs build-essential python2.7
git clone "https://github.com/cjdelisle/cjdns" || (echo "error cloning project" && exit)
cd cjdns && sudo docker build .
