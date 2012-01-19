#
# Cookbook Name:: rsyslog
# Resource:: rsyslog_log
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

actions :create, :delete

attribute :name,       :kind_of => String, :name_attribute => true
attribute :path,       :kind_of => String, :required => true
attribute :mode,       :regex => /^0?\d{3,4}$/, :default => 0755
attribute :owner,      :regex => [ /^([a-z]|[A-Z]|[0-9]|_|-)+$/, /^\d+$/ ], :default => "root"
attribute :group,      :regex => [ /^([a-z]|[A-Z]|[0-9]|_|-)+$/, /^\d+$/ ], :default => "root"
attribute :max_size,   :kind_of => Integer, :default => 100
attribute :rotations,  :kind_of => Integer, :default => 2
attribute :programs,   :kind_of => String
attribute :facilities, :kind_of => String
