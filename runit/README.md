Description
===========

Installs runit and provides LWRP for managing runit services.

* http://smarden.org/runit/

Requirements
============

Works on Debian, Ubuntu and Gentoo

Attributes
==========

For description of the attributes, see the cookbook metadata.

Resource/Provider
=================

This cookbook includes an LWRP for managing runit services.

Actions:

- *start* - starts the service
- *stop* - stops the service
- *enable* - enables the service, creating the run scripts and symlinks
- *disable* - downs the service and removes the service symlink
- *restart* - restarts the service
- *reload* - reloads the service with force-reload
- *once* - starts the service once
- *hup* - sends the hup signal to the service
- *cont* - sends the cont signal to the service
- *term* - sends the term signal to the service
- *kill* - sends the kill signal to the service

Service management actions are taken with runit's "sv" program.

Parameter Attributes

- *service_name* - name of the service - name attribute
- *directory* - directory where the service configuration lives
- *control* - customize control of the service, see runsv man page
- *options* - options passed as variables to templates, for compatibility with legacy runit service definition
- *variables* - uses the options hash to pass variables to templates
- *env* - environment values to pass via the service's env directory
- *log* - whether to start the service's logger with svlogd, requires a template `sv-service_name-log-run.erb` to configure the logs run script
- *cookbook* - cookbook where templates should be located instead of where the LWRP is used
- *template* - name of the template, defaults to `service_name`, set to false to not render a template (e.g. if a package supplies its own runit scripts)
- *finish* - whether the service has a finish script, requires a template `sv-service_name-finish.erb`
- *owner* - user that should own the templates created to enable the service
- *group* - group that should own the templates created to enable the service

runsv(8) man page is available online:

* http://smarden.org/runit/runsv.8.html

svlogd(8) man page is available online:

* http://smarden.org/runit/svlogd.8.html

Usage
=====

Include the runit recipe in a node's run list, or in a role to install runit as a package on the system. The LWRP doesn't include the runit recipe, so ensure that the recipe is included before using the LWRP, in addition to including a cookbook dependency.

Example usage of the `runit_service` LWRP:

    runit_service "chef-client" do
      action [:enable, :start]
      directory "/etc/sv/chef-client"
      log true
    end

License and Author
==================

Author: Joshua Timberman (<joshua@opscode.com>)

Copyright 2008-2011, Opscode, Inc.

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
