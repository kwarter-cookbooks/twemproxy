#
# Cookbook Name:: twemproxy
# Recipe:: package
#
# Author:: Daniel Koepke (<daniel.koepke@kwarter.com>)
#
# Copyright 2013, Kwarter, Inc.
#

package node[:twemproxy][:package] do
    version node[:twemproxy][:package_version]
    action :install
end
