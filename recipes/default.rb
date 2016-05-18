#
# Cookbook Name:: phantomjs
# Recipe:: default
#
# Copyright 2016, Jonathan Newman
#
# All rights reserved - Do Not Redistribute
#

version = node[:phantomjs][:version]
install_dir = "#{node[:phantomjs][:install_dir]}/phantomjs"
tarball = "phantomjs-#{version}-linux-x86_64.tar.bz2"

remote_file "#{node[:phantomjs][:download_dir]}/#{tarball}" do
  source "#{node[:phantomjs][:download_url]}/#{tarball}"
  owner 'root'
  group 'root'
  mode '0755'
  not_if { ::File.exists?(install_dir) }
end

bash 'install_phantomjs' do
  user 'root'
  cwd "#{node[:phantomjs][:download_dir]}"
  code <<-EOH
    tar xjf #{tarball}
    mv #{tarball.gsub(/\.tar.+$/, '')}/bin/phantomjs #{install_dir}
  EOH
  not_if { ::File.exists?(install_dir) }
end
