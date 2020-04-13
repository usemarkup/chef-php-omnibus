name 'php-omnibus'
description 'an omnibus of packages to ease installing php'
version '1.0.0'

maintainer 'Gavin Staniforth'
maintainer_email 'gavin@usemarkup.com'

source_url 'https://github.com/usemarkup/chef-php-omnibus'

supports 'centos', '>= 6.9'
supports 'centos', '>= 7.4'

depends 'yum-epel'
depends 'yum-ius'
depends 'php'
depends 'php-fpm'

# version 3 does not work on chef v12, remove once v12 support is dropped
depends 'seven_zip', '<3.0.0'

chef_version '>= 13.0'
