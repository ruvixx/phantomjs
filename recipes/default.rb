#
# Cookbook Name:: apt-packages
# Recipe:: default
#
# Copyright 2015, Hai Phan
#
# All rights reserved - Do Not Redistribute
#

execute 'Install phantomjs' do
  command 'wget https://bitbucket.org/ariya/phantomjs/downloads/phantomjs-2.1.1-linux-x86_64.tar.bz2 && \
           tar xjf phantomjs-2.1.1-linux-x86_64.tar.bz2 && \
           mv phantomjs-2.1.1-linux-x86_64/bin/phantomjs /usr/bin/phantomjs && \
           rm phantomjs-2.1.1-linux-x86_64.tar.bz2 && rm -rf phantomjs-2.1.1-linux-x86_64'
end
