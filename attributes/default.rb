#
# Cookbook Name:: twemproxy
# Attributes:: default
#
# Author:: Daniel Koepke (<daniel.koepke@kwarter.com>)
#
# Copyright 2013, Kwarter, Inc.
#

default[:twemproxy][:install_method] = "package"

default[:twemproxy][:version] = "0.2.3"
default[:twemproxy][:source_url] = "https://code.google.com/p/twemproxy/downloads/detail?name=nutcracker-#{default[:twemproxy][:version]}.tar.gz&can=2&q="

default[:twemproxy][:package] = "nutcracker"
default[:twemproxy][:package_version] = nil

default[:twemproxy][:config_file] = "/etc/nutcracker.conf"

# This is a straightforward translation of the twemproxy YAML configuration into a Ruby hash.
default[:twemproxy][:config] = {}
