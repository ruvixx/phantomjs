#
# Cookbook Name:: apt-packages
# Recipe:: default
#
# Copyright 2015, Hai Phan
#
# All rights reserved - Do Not Redistribute
#

# So we install packages with sudo
# Chef::Provider::Package::Apt.send(:include, CustomApt::UseSudo)

include_recipe "apt::default"

node['apt']['repositories'].each do |pkg|
  f = apt_repository pkg['name'] do
    action :nothing
  end
  pkg.each do |key, value|
    f.send(key, value) unless key == 'name' || key == 'action'
  end
  action = pkg.key?('action') ? pkg['action'] : :add
  f.action(action)
end if node['apt'].key?('repositories')

node['apt']['packages'].each do |pkg|
  f = package pkg['name'] do
    action :nothing
  end
  pkg.each do |key, value|
    f.send(key, value) unless key == 'name' || key == 'action'
  end
  action = pkg.key?('action') ? pkg['action'] : :upgrade
  f.action(action)
end if node['apt'].key?('packages')
