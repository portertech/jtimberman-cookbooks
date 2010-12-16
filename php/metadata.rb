maintainer        "Opscode, Inc."
maintainer_email  "cookbooks@opscode.com"
license           "Apache 2.0"
description       "Installs and maintains php and php modules"
version           "1.0.0"
recipe            "php", "Empty, use one of the other recipes"
recipe            "php::module_apc", "Install the php5-apc package"
recipe            "php::module_curl", "Install the php5-curl package"
recipe            "php::module_fileinfo", "Install the php5-fileinfo package"
recipe            "php::module_fpdf", "Install the php-fpdf package"
recipe            "php::module_gd", "Install the php5-gd package"
recipe            "php::module_ldap", "Install the php5-ldap package"
recipe            "php::module_imap", "Install the php5-imap package"
recipe            "php::module_imagemagick", "Install the php5-imagemagick package"
recipe            "php::module_memcache", "Install the php5-memcache package"
recipe            "php::module_mysql", "Install the php5-mysql package"
recipe            "php::module_mcrypt", "Install the php5-mcrypt package"
recipe            "php::module_pgsql", "Install the php5-pgsql packag"
recipe            "php::module_sqlite3", "Install the php5-sqlite3 package"
recipe            "php::module_sybase", "Install the php5-sybase package"
recipe            "php::pear", "Install the php-pear package"
recipe            "php::php4", "Install packages for PHP version 4"
recipe            "php::php5-cgi", "Install the php5-cgi package"
recipe            "php::php5", "Install php5 packages and php.ini config file"

%w{ apache2 build-essential xml mysql }.each do |cb|
  depends cb
end

%w{ debian ubuntu centos redhat fedora }.each do |os|
  supports os
end
