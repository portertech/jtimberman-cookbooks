#
# Cookbook Name:: rsyslog
# Provider:: rsyslog_output_channel
#
# Copyright 2012, Sonian Inc.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or
# implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

action :create do
  file "/etc/rsyslog.d/log_rotation.sh" do
    mode 0755
  end

  programs = new_resource.programs.nil? ? [new_resource.name] : new_resource.programs
  facilities = new_resource.facilities.nil? ? [] : new_resource.facilities

  template "/etc/rsyslog.d/60-#{new_resource.name}.conf" do
    source "output_channel.conf.erb"
    mode 0744
    variables(
      :name => new_resource.name,
      :path => new_resource.path,
      :max_size => new_resource.max_size * 1048576,
      :rotations => new_resource.rotations,
      :programs => programs.map{|p| "$programname == '#{p}'"}.join(' or '),
      :facilities => facilities.map{|f| "$syslogfacility-text == '#{f}'"}.join(' or ')
    )
    notifies :restart, resources(:service => "rsyslog"), :delayed
  end
end

action :delete do
  file "/etc/rsyslog.d/60-#{new_resource.name}.conf" do
    action :delete
    notifies :restart, resources(:service => "rsyslog"), :delayed
  end
end
