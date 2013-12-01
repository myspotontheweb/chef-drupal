#
# Cookbook Name:: drupal
# Recipe:: drupal
#
# Copyright (C) 2013 Mark O'Connor
# 
# All rights reserved - Do Not Redistribute
#
include_recipe "application"

package "git-core"

directory "/usr/local/drupal/shared/files" do
  recursive true
end

application "drupal" do
  path "/usr/local/drupal"
  owner node[:apache][:user]
  group node[:apache][:user]
  repository "http://git.drupal.org/project/drupal.git"
  revision "7.19"
  packages ["php-dom", "php-gd", "php-pdo", "php-mbstring", "php-mysql"]
  purge_before_symlink ["sites/default/files"]
  symlinks(
    "settings.php" => "sites/default/settings.php",
    "files" => "sites/default/files"
  )

  php do
    local_settings_file "settings.php"
    database do
      host "33.33.33.11"
      name "drupal"
      user "drupal"
      pass "changeme"
      drupal_salt "yJ6NwxzR70jWeZC_BJDKF4NzrEX5qZkuNIeF3oc9dFs"
    end
  end

  mod_php_apache2 do
    webapp_template "drupal.conf.erb"
  end
end

directory "/usr/local/drupal/shared/files" do
  user  node[:apache][:user]
  group node[:apache][:user]
end
