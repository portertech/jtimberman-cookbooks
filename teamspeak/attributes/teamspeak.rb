# Cookbook Name:: teamspeak
# Attributes:: teamspeak
#
# Copyright 2009, Joshua Timberman
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

teamspeak Mash.new unless attribute?("teamspeak")

teamspeak[:http_port]  = 14534 unless teamspeak.has_key?(:http_port)
teamspeak[:query_port] = 51342 unless teamspeak.has_key?(:query_port)
teamspeak[:ts_server]  = "teamspeak.#{domain}" unless teamspeak.has_key?(:ts_server)
teamspeak[:posturl]    = "http://#{teamspeak[:ts_server]}/tsdisplay/demo.php" unless teamspeak.has_key?(:posturl)

