# == Class: sssd::install
#
# This class installs sssd.  It is not intended to be called directly.
#
#
class sssd::install (
) {

  if $caller_module_name != $module_name {
    fail("Use of private class ${name} by ${caller_module_name}")
  }

  package { 'sssd':
    ensure => 'latest',
  }

  if $osfamily == RedHat {
    package { 'sssd-client':
      ensure => 'latest',
    }
  }

  if versioncmp($::operatingsystemrelease, '7.0') >= 0 or $osfamily == Debian {
    package { 'oddjob-mkhomedir':
      ensure => 'installed',
    }
  }

}
