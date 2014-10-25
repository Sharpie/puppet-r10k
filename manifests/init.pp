# == Class: r10k
#
# Install r10k.
#
# === Parameters
#
# === Examples
#
#  class { r10k: }
#
# === Authors
#
# Charlie Sharpsteen <source@sharpsteen.net>
# Michael Gruener <michael.gruener@chaosmoon.net>
#
class r10k {
  if $::osfamily == 'RedHat' {
    include r10k::install::rpm
  } else {
    include r10k::install::gem
  }
}
