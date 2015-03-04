#
# Cookbook Name:: freeradius
# Recipe:: package
#
# Copyright 2011, Hexa
#
# All rights reserved - Do Not Redistribute
#

node['freeradius']['pkgs'].each do |pkg|
  package pkg do
    action :install
  end
end

if node['freeradius']['enable_ldap'] == true
  file '/etc/init/freeradius.conf' do
    action :delete
  end

  node['freeradius']['ldap_pkgs'].each do |pkg|
    package pkg do
      action :install
    end
  end
end
