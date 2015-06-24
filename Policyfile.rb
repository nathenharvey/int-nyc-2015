# Policyfile.rb - Describe how you want Chef to build your system.
#
# For more information on the Policyfile feature, visit
# https://github.com/opscode/chef-dk/blob/master/POLICYFILE_README.md

# A name that describes what the system you're building with Chef does.
name "chef-intermediate-workshop"

# Where to find external cookbooks:
default_source :community

# run_list: chef-client will run these recipes in the order specified.
run_list(
  "recipe[email_handler]",
  "recipe[chef-client::delete_validation]",
  "recipe[chef-client]",
  "recipe[chef-client::config]",
  "recipe[ntp]",
  "recipe[motd]",
  "recipe[users]",
  "recipe[apache]"
)

cookbook 'email_handler', path: 'cookbooks/email_handler'
cookbook 'mailx', path: 'cookbooks/mailx'
cookbook 'motd', path: 'cookbooks/motd'
cookbook 'apache', path: 'cookbooks/apache'
cookbook 'users', path: 'cookbooks/users'
cookbook 'pci', path: 'cookbooks/pci'

# set attributes
default["chef_client"]["config"]["ssl_verify_mode"] = ":verify_peer"
default["chef_client"]["config"]["log_level"] = ":info"
default["ohai"]["disabled_plugins"] = [":Passwd"]


# Specify a custom source for a single cookbook:
# cookbook "development_cookbook", path: "../cookbooks/development_cookbook"
