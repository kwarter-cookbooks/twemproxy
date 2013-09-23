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
  action [ :configure, :build_with_make ]
end
