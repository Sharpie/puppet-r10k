# == Class: r10k
#
# Install r10k.
#
# === Parameters
#
# [*ensure*]
#   Version of r10k to install. Accepts any ensure state that is valid for the
#   Package type. Default: present
#
# [*provider*]
#   Provider to install the r10k package
#   Default: gem
#
# === Examples
#
#  class { r10k: ensure => '1.0.0' }
#
# === Authors
#
# Charlie Sharpsteen <source@sharpsteen.net>
#
class r10k (
  $ensure   = 'present',
  $provider = 'gem',
){

  package { 'r10k':
    ensure   => $ensure,
    provider => $provider,
  }

}
