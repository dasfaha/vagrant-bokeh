#!/usr/bin/env bash
#Install all dependencies
apt-get -y update
apt-get install -y build-essential
apt-get install -y gcc-4.6-base cpp-4.6 libgomp1 libquadmath0 libc6-dev
apt-get install -y libevent-dev 
#Version in repository is too old (2.2) we're looking for 2.8. Installing manually later.
#apt-get install -y redis-server
apt-get install -y python-numpy
apt-get install -y python-scipy
apt-get install -y  python-pip
apt-get install -y git
apt-get install -y python-all-dev
apt-get install -y python-yaml
apt-get install -y curl

pip install --no-input flask
pip install --no-input requests
pip install --no-input gevent
pip install --no-input gevent-websocket
pip install --no-input pandas

#Installing latest stable redis server
wget http://download.redis.io/redis-stable.tar.gz
tar xvzf redis-stable.tar.gz
cd redis-stable;make
#Docs recommend running tests
#sudo make test
sudo cp src/redis-server /usr/local/bin/
sudo cp src/redis-cli /usr/local/bin/

#Not sure if necessary but install redis first then the Pyton bindings
pip install --no-input redis

#get source code and build
cd /vagrant
git clone https://github.com/dasfaha/bokeh.git
cd bokeh; python setup.py install
python setup.py develop
python -c "from bokeh import sampledata; sampledata.download();"