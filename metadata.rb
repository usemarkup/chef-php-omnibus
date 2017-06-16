name 'php-omnibus'
license 'MIT Licence'
description 'phabricator project'
version '0.1.0'

supports 'centos', '>= 6.8'

depends 'yum-epel'
depends 'yum-ius'
depends 'php'
depends 'php-fpm'

chef_version '>= 12.7' if respond_to?(:chef_version)
