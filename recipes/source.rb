#
# Cookbook Name:: twemproxy
# Recipe:: source
#
# Author:: Daniel Koepke (<daniel.koepke@kwarter.com>)
#
# Copyright 2013, Kwarter, Inc.
#

local_name ="#{Chef::Config['file_cache_path']}/nutcracker.tar.gz" 

remote_file local_name do
  source node[:twemproxy][:source_url]
  action :nothing
end

http_request "HEAD #{node[:twemproxy][:source_url]}" do
  message ""
  url node[:twemproxy][:source_url]
  action :head
  if File.exists?(local_name)
    headers "If-Modified-Since" => File.mtime(local_name).httpdate
  end
  notifies :create, "remote_file[#{local_name}]", :immediately
end

bash "build_nutcracker" do
    cwd ::File.dirname(local_name)
    code <<-EOH
        tar xzf #{local_name}
        ./configure && make && make install
    EOH
end
