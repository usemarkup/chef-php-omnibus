node.default['php']['packages'] = [
  'php71u-cli',
  'php71u-intl',
  'php71u-curl',
  'php71u-mbstring',
  'php71u-json',
  'php71u-opcache',
  'pear1u',
]

node.default['php']['directives'] = {
  'expose_php' => 0,
  'memory_limit' => -1,
  'max_execution_time' => 3,

  'realpath_cache_size' => '4096k',
  'realpath_cache_ttl' => 7200,

  'error_log' => 'syslog',
  'serialize_precision' => '-1',
}

include_recipe 'php'

node.default['php']['opcache-directives'] = {
  'opcache.fast_shutdown' => 1,
  'opcache.enable_cli' => 0,

  'opcache.memory_consumption' => 128,
  'opcache.interned_strings_buffer' => 32,
  'opcache.max_accelerated_files' => 25000,
}

# Opcache settings need to be stored saved in /etc/php.d/ due to system defaults in 10-opcache
file '/etc/php.d/zz-opcache.ini' do
  content node['php']['opcache-directives'].map { |k, v| "#{k}=#{v}" }.join("\n")
  mode '0664'
end
