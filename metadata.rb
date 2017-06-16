name 'php-omnibus'
license 'MIT Licence'
description 'phabricator project'
version '0.1.2'

maintainer 'Gavin Staniforth'
maintainer_email 'gavin@usemarkup.com'

source_url 'https://github.com/usemarkup/chef-php-omnibus'

supports 'centos', '>= 6.8'

depends 'yum-epel'
depends 'yum-ius'
depends 'php'
depends 'php-fpm'

chef_version '>= 12.7' if respond_to?(:chef_version)
