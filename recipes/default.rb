node.default['php']['packages'] = [
  'php71u-cli',
  'php71u-intl',
  'php71u-curl',
  'php71u-fpm',
  'php71u-mbstring',
  'php71u-json',
  'php71u-opcache',
  'pear1u',
]

node.default['php']['directives'] = {
  'expose_php' => 0,
  'memory_limit' => -1,
  'max_execution_time' => 5,

  'realpath_cache_size' => '4096k',
  'realpath_cache_ttl' => 7200,

  'error_log' => 'syslog',
}

include_recipe 'php'

node.default['php-fpm']['user'] = 'nobody'
node.default['php-fpm']['group'] = 'nobody'
node.default['php-fpm']['package_name'] = 'php71u-fpm'
node.default['php-fpm']['service_name'] = 'php-fpm'

include_recipe 'php-fpm'

node.default['php']['opcache-directives'] = {
  'opcache.fast_shutdown' => 1,
  'opcache.enable_cli' => 0,

  'opcache.memory_consumption' => 128, # Assumes you have at least 128M of RAM to spare
  'opcache.interned_strings_buffer' => 64,
  'opcache.max_accelerated_files' => 25000,
}

# Opcache settings need to be stored saved in /etc/php.d/ due to system defaults in 10-opcache

file '/etc/php.d/zz-opcache.ini' do
  content node['php']['opcache-directives'].map { |k, v| "#{k}=#{v}" }.join("\n")
  mode '0664'
end
