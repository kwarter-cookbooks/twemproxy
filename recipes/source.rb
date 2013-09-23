#
# Cookbook Name:: twemproxy
# Recipe:: source
#
# Author:: Daniel Koepke (<daniel.koepke@kwarter.com>)
#
# Copyright 2013, Kwarter, Inc.
#

include_recipe "ark"

ark "twemproxy" do
  url node[:twemproxy][:source_url]
  version node[:twemproxy][:version]
  action [ :configure, :install_with_make ]
end

template "nutcracker-init" do
  path "/etc/init.d/nutcracker"
  source "nutcracker.init.erb"
  mode 0755
end
