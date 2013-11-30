# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.require_plugin "vagrant-omnibus"
Vagrant.require_plugin "vagrant-chef-zero"
Vagrant.require_plugin "vagrant-berkshelf"

Vagrant.configure("2") do |config|

  config.vm.hostname = "drupal"

  # Box config
  config.vm.box = "Berkshelf-CentOS-6.3-x86_64-minimal"
  config.vm.box_url = "https://dl.dropbox.com/u/31081437/Berkshelf-CentOS-6.3-x86_64-minimal.box"

  # Plugin config
  config.omnibus.chef_version = "11.4.0"
  config.berkshelf.enabled = true
  config.chef_zero.chef_repo_path = "chef_repo"

  # Multi-machine setup
  config.vm.define "mysql" do |mysql|
    # network config
    mysql.vm.network :private_network, ip: "33.33.33.11"

    # Provisioning config
    mysql.vm.provision :chef_client do |chef|
      chef.add_recipe "drupal::db"
      chef.add_role "db"
      chef.json = {
        :mysql => {
          :bind_address => '33.33.33.11',
          :server_root_password => 'changeme',
          :server_debian_password => 'changeme',
          :server_repl_password => 'changeme'
        }
      }
    end
  end

  config.vm.define "drupal" do |drupal|
    # network config
    drupal.vm.network :private_network, ip: "33.33.33.12"

    # Provisioning config
    drupal.vm.provision :chef_client do |chef|
      chef.add_recipe "drupal::drupal"
      chef.add_role "appserver"
      chef.json = {
        :drupal => {
          :db => {
            :host => "33.33.33.11"
          }
        }
      }
    end
  end
end
