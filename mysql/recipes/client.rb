#
# Cookbook Name:: mysql
# Recipe:: client
#
# Copyright 2008-2011, Opscode, Inc.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

::Chef::Resource::Package.send(:include, Opscode::Mysql::Helpers)

package "mysql-devel" do
  package_name begin
    if platform?(%w{ redhat centos scientific fedora suse })
      "mysql-devel"
    elsif debian_before_squeeze? || ubuntu_before_lucid?
      "libmysqlclient15-dev"
    else
      "libmysqlclient-dev"
    end
  end
  action :install
end

package "mysql-client" do
  package_name value_for_platform(
    [ "centos", "redhat", "scientific", "fedora", "suse"] => { "default" => "mysql" },
    "default" => "mysql-client"
  )
  action :install
end

# fullstack
if node[:chef_packages][:chef][:chef_root] =~ /^\/opt\/opscode\/embedded/ or
   ! platform?(%w{debian ubuntu redhat centos scientific fedora suse}) then

   gem_package "mysql" do
    action :install
  end

else
  package "mysql ruby libraries" do
    package_name value_for_platform(
      [ "centos", "redhat", "suse", "fedora", "scientific"] => { "default" => "ruby-mysql" },
      ["debian", "ubuntu"] => { "default" => 'libmysql-ruby' },
      "default" => 'libmysql-ruby'
    )
    action :install
  end
end

