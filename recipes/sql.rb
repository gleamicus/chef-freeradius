template "#{node['freeradius']['dir']}/sql.conf" do
  source "sql.conf.erb"
  owner node['freeradius']['user']
  group node['freeradius']['group']
  mode 0600
  notifies :restart, "service[#{node['freeradius']['service']}]"
end
