#
# Cookbook Name:: drupal
# Recipe:: db
#
# Copyright (C) 2013 Mark O'Connor
# 
# All rights reserved - Do Not Redistribute
#
include_recipe "mysql::server"
include_recipe "mysql::ruby"
include_recipe "database"

mysql_connection_info = {
  :host     => 'localhost',
  :username => 'root',
  :password => node['mysql']['server_root_password']
}

mysql_database node['drupal']['db']['name'] do
  connection mysql_connection_info
  action :create
end

mysql_database_user node['drupal']['db']['user'] do
  connection    mysql_connection_info
  password      node['drupal']['db']['pass']
  database_name node['drupal']['db']['name']
  host          '%'
  privileges    ["SELECT", "INSERT", "UPDATE", "DELETE", "CREATE", "DROP", "INDEX", "ALTER", "LOCK TABLES", "CREATE TEMPORARY TABLES"]
  action        :grant
end

