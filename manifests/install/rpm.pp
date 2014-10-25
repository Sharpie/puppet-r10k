# == Class: r10k::install::rpm
#
# Install r10k (rpm).
#
# === Parameters
#
# [*ensure*]
#   Version of r10k to install. Accepts any ensure state that is valid for the
#   Package type. Default: present
# [*ensure_repo*]
#   Use a custom repository to install the r10k rpms from
# [*repo_baseurl*]
#   The baseurl for the repository
#
# === Examples
#
#  class { r10k::install::rpm:
#    ensure       => '1.0.0',
#    ensure_repo  => 'absent',
#    repo_baseurl => 'http://copr-be.cloud.fedoraproject.org/results/jonkelley/r10k/epel-6-$basearch/'
#  }
#
# === Authors
#
# Charlie Sharpsteen <source@sharpsteen.net>
# Michael Gruener <michael.gruener@chaosmoon.net>
#

class r10k::install::rpm (
  $ensure       = 'present',
  $ensure_repo  = 'present',
  $repo_baseurl = 'http://copr-be.cloud.fedoraproject.org/results/jonkelley/r10k/epel-6-$basearch/'
) {
  if $::osfamily == 'RedHat' {
    yumrepo { 'r10k':
      ensure              => $ensure_repo,
      descr               => 'r10k repository',
      baseurl             => $repo_baseurl,
      skip_if_unavailable => 'True',
      gpgcheck            => '0',

    }

    package { 'rubygem-r10k':
      ensure   => $ensure,
    }
  } else {
    fail('The class r10k::install::rpm is only intended for RedHat style systems (Fedora / Centos / RHEL).')
  }
}
