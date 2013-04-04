Description
===========

Installs twemproxy (a.k.a., nutcracker).

Requirements
============

The installation method is set with `node[:twemproxy][:install_method]`. The
default is `package`. However, there is not an official package available.
You'll need to either find a PPA or package it up yourself.

You can try setting `node[:twemproxy][:install_method]` to `source`, but we
don't use this method, and it's not tested.

Attributes
==========

* `node[:twemproxy][:install_method]` chooses how to install twemproxy,
  either `package` (the default) for installing from a package or `source`
  to install from source.
* `node[:twemproxy][:package]` is the name of the package to install when
  `install_method` is `package`. Defaults to `nutcracker`.
* `node[:twemproxy][:package_version]` is the version of the package to
  install. It defaults to `nil` which will install the latest version
  available.
* `node[:twemproxy][:source_url]` is the URL of the source to download when
  `install_method` is `source`.
* `node[:twemproxy][:config_file]` is the configuration file to write.
* `node[:twemproxy][:config]` is the contents of the configuration file.

Usage
=====

At minimum, you'll need to provide a package called `nutcracker` in an APT
repository listed in your sources, and then setup the twemproxy config
attribute in a role (or environment) like so:

    default_attributes(
        # ...
        :twemproxy => {
            :config => {
                # This is the name of a section in the twemproxy YAML file.
                :alpha => {
                    # These are the lines of configuration written out.
                    :config => [
                        "listen: 127.0.0.1:22121",
                        "redis: true",
                        # ...
                        "servers:",
                        " - 127.0.0.1:3680:1 server1",
                        " - 127.0.0.1:3681:1 server2",
                        " - 127.0.0.1:3682:1 server3",
                        " - 127.0.0.1:3682:1 server4",
                    ],
                },
            },
        },
    )

This will write a configuration file (by default named `/etc/nutcracker.conf`,
but you can specify one with `node[:twemproxy][:config_file]`) like this:

    alpha:
        listen: 127.0.0.1:22121
        redis: true
        ...
        servers:
         - 127.0.0.1:3680:1 server1
         - 127.0.0.1:3681:1 server2
         - 127.0.0.1:3682:1 server3
         - 127.0.0.1:3683:1 server4

