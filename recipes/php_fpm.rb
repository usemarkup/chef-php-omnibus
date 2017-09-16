node.default['php-fpm']['user'] = 'nobody'
node.default['php-fpm']['group'] = 'nobody'

node.default['php-fpm']['package_name'] = 'php71u-fpm'
node.default['php-fpm']['service_name'] = 'php-fpm'

include_recipe 'php-fpm'

# Reload PHP-FPM if the /etc/php.ini file is altered
# Note the /etc/php.ini is hardcoded in the php cookbook
# https://github.com/chef-cookbooks/php/search?utf8=%E2%9C%93&q=%2Fetc%2Fphp.ini&type=
service 'php-fpm-reload' do
  pattern node['php-fpm']['service_name']
  subscribes :reload, 'template[/etc/php.ini]', :delayed
  only_if { `whereis php-fpm` }
end
