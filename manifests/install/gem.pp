# == Class: r10k::install::gem
#
# Install r10k (gem).
#
# === Parameters
#
# [*ensure*]
#   Version of r10k to install. Accepts any ensure state that is valid for the
#   Package type. Default: present
#
# === Examples
#
#  class { r10k::install::gem: ensure => '1.0.0' }
#
# === Authors
#
# Charlie Sharpsteen <source@sharpsteen.net>
# Michael Gruener <michael.gruener@chaosmoon.net>
#
class r10k::install::gem (
  $ensure = 'present',
){

  package { 'r10k':
    ensure   => $ensure,
    provider => 'gem',
  }

}
