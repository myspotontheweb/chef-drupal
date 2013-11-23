#
# Cookbook Name:: drupal
# Recipe:: default
#
# Copyright (C) 2013 YOUR_NAME
# 
# All rights reserved - Do Not Redistribute
#
include_recipe "application"

package "git-core"

application "drupal" do
  path "/usr/local/www/sites/drupal"
  owner node[:apache][:user]
  group node[:apache][:user]
  repository "http://git.drupal.org/project/drupal.git"
  revision "7.19"
  packages ["php-dom", "php-gd", "php-pdo", "php-mbstring", "php-mysql"]

  php 

  mod_php_apache2 do
    webapp_template "drupal.conf.erb"
  end
end
