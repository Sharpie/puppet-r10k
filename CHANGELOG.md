# Changelog

## 0.3.0

Released 01-04-2015

Changes:

  - Modernized module structure and dropped test coverage for Puppet 2.7.x.

  - Removed `purgedirs` parameter from `r10k::config` class. This was apparently
    unused in r10k 1.0 and removed in 1.1.

  - Added `postrun` parameter to the `r10k::config` class.

## 0.2.0

Released 06-07-2014

Improvements:

  - The `r10k::config` class now passes the `path`, `owner`, `group` and `mode`
    parameters to the underlying `file` resource.

## 0.1.0

Released 03-09-2014

Functionally equivalent to `0.0.1`, but with the addition of tests.

## 0.0.1

Released 07-11-2013

Initial release.
