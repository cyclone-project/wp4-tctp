#!/bin/bash -e

#
# Author     : Oleg Lodygensky
# Copyrights : CNRS
# License    : Apache2
#
# Revisions
#  Jun 24th, 2016 : first version
#
# This scripts installs TCTP
# (https://github.com/TU-Berlin-SNET/tresor-proxy.git)
# This has been test under Ubuntu 14
#
# 

set -x

sudo apt-get -y update
sudo apt-get -y upgrade

sudo apt-get install -y g++ gcc git libncurses5-dev libssl-dev make openssl zlib1g-dev

gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3
curl -sSL https://get.rvm.io | bash -s stable --ruby=2.2.3
. ${HOME}/.rvm/scripts/rvm
. ${HOME}/.bashrc

rm -Rf tresor-proxy
git clone https://github.com/TU-Berlin-SNET/tresor-proxy.git
cd tresor-proxy
rvm install 2.3
ruby --version
gem install eventmachine
gem install bundler
gem install json
gem install i18n
bundle install
