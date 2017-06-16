node.default['php']['packages'] = [
  'php71u-cli',
  'php71u-intl',
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

  'opcache.fast_shutdown' => 1,
  'opcache.enable_cl' => 0,

  'opcache.memory_consumption' => 128,
  'opcache.interned_strings_buffer' => 64,
  'opcache.max_accelerated_files' => 25000,
}

include_recipe 'php'

node.default['php-fpm']['user'] = 'nobody'
node.default['php-fpm']['group'] = 'nobody'
node.default['php-fpm']['package_name'] = 'php71u-fpm'
node.default['php-fpm']['service_name'] = 'php-fpm'

include_recipe 'php-fpm'
