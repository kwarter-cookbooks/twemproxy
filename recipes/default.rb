#
# Cookbook Name:: twemproxy
# Recipe:: default
#
# Author:: Daniel Koepke (<daniel.koepke@kwarter.com>)
#
# Copyright 2013, Kwarter, Inc.
#

include_recipe "twemproxy::#{node[:twemproxy][:install_method]}"

template "nutcracker-conf" do
    path node[:twemproxy][:config_file]
    source "nutcracker.conf.erb"
    mode 0644
    variables :sections => node[:twemproxy][:config]
    notifies :restart, "service[nutcracker]"
end

service "nutcracker" do
    action [:enable, :start]
    supports :reload => true, :restart => true, :status => true
    subscribes :restart, resources(:template => "nutcracker-conf")
end
