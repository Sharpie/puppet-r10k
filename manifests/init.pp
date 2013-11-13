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
# [*package_name*]
#   Name of the package to install
#   Default: r10k
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
  $ensure       = 'present',
  $package_name = 'r10k',
  $provider     = 'gem',
){

  package { $package_name:
    ensure   => $ensure,
    provider => $provider,
  }

}
