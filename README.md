sharpie-r10k
============
[![Build Status](https://travis-ci.org/Sharpie/puppet-r10k.png?branch=master)](https://travis-ci.org/Sharpie/puppet-r10k)

A [Puppet][puppet] module to install and configure [r10k][r10k], the killer robot powered Puppet deployment tool.

There are two other r10k modules available on the [module forge][puppet-forge] that pre-date this one:

  - [ploperations/r10k][ploperations-r10k]

  - [zack/r10k][zack-r10k]

Both have interesting features such as cron setup or MCollective integration.
Compared to `zack/r10k`, this module aims for minimal complexity and provides just enough Puppet policy to manage the r10k configuration file.
In many respects, `zack/r10k` is "the r10k module" and this module is "r10k-lite".
Compared to `ploperations/r10k`, this module emphasizes configuration through [Hiera data bindings][hiera-bindings] rather than statically served files.

### Caveats

This package has no stable releases yet.
Specifically, _there is limited test coverage and all interfaces are subject to change_.
**Use in production at your own risk.**

For production systems, I heartily recommend using `zack/r10k` instead of this module.

This package is hard-wired to manage the system-wide r10k config file `/etc/r10k.yaml` which is owned by `root`.
This restriction may be lifted in future versions.

  [puppet]: https://github.com/puppetlabs/puppet
  [r10k]: https://github.com/adrienthebo/r10k
  [puppet-forge]: http://forge.puppetlabs.com/
  [ploperations-r10k]: http://forge.puppetlabs.com/ploperations/r10k
  [zack-r10k]: http://forge.puppetlabs.com/zack/r10k
  [hiera-bindings]: http://docs.puppetlabs.com/hiera/1/puppet.html#automatic-parameter-lookup


Dependencies
------------

This module should only be used to install and manage r10k versions 1.0.0 or newer.

This module was designed with Puppet 3.x in mind and makes extensive use of Hiera data bindings.
The module may function on Puppet 2.7.x, but there are currently no tests or guarantees surrounding such functionality.

For r10k to be fully functional after installation and configuration, a git package should also be included on the managed node.


Examples
--------

Currently this module provides two classes: `r10k` and `r10k::config`

The `r10k` class is pretty simple to use and only takes one parameter, `ensure`:

```puppet
class {'r10k': ensure => '1.0.0'}
```

Installation is performed by a `Package` type using the `gem` provider.
Thus, the `ensure` parameter can accept any value that is valid for the `Package` type.


The `r10k::config` class manages the contents of `/etc/r10k.yaml` and accepts three parameters:

  * `cachedir`:
    Path to a directory to be used by r10k for caching data.
    Default: `/var/cache/r10k`

  * `sources`:
    Hash containing data sources to be used by r10k to create dynamic Puppet environments.
    Default: `{}`

Detailed information on these parameters can be found in the [r10k documentation][r10k-docs].

The `r10k::config` class is designed to be used in conjunction with Hiera data:

```yaml
---
# In a Hiera datasource
r10k::ensure: '1.0.0'
r10k::config::sources:
  somename:
    remote: 'ssh://git@github.com/someuser/somerepo.git'
    basedir: '%{::settings::confdir}/environments'
  someothername:
    remote: 'ssh://git@github.com/someuser/someotherrepo.git'
    basedir: '/some/other/basedir'
```

```puppet
# In a Puppet manifest
class { 'r10k': }         # Ensured to be version 1.0.0
class { 'r10k::config': } # Magic!
```

The `r10k::config` class can also be used without Hiera data:

```puppet
class { 'r10k::config':
  sources => {
    'somename' => {
      'remote'  => 'ssh://git@github.com/someuser/somerepo.git',
      'basedir' => "${::settings::confdir}/environments"
    },
    'someothername' => {
      'remote'  => 'ssh://git@github.com/someuser/someotherrepo.git',
      'basedir' => '/some/other/basedir'
    },
  },
}
```

  [r10k-docs]: https://github.com/adrienthebo/r10k/blob/master/doc/dynamic-environments/configuration.mkd


Support
-------

Please log tickets and issues at: https://github.com/Sharpie/puppet-r10k/issues
