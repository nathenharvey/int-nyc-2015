#
# Cookbook Name:: hello
# Recipe:: default
#
# Copyright (c) 2015 The Authors, All Rights Reserved.

apache_name = "httpd"

if node['platform_family'] == "debian"
  apache_name = "apache2"
  include_recipe "apt::default"
end

service "#{apache_name}" do
  action :start
end

package "#{apache_name}"
