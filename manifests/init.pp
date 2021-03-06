# == Class: entropy
#
# This class allows you to install and configure ekyd, ekeyd-egd-linux
# includeing stunnel and encryption.
#
# === Parameters
#
# Document parameters here.
#
# [*sample_parameter*]
#   Explanation of what this parameter affects and what it defaults to.
#   e.g. "Specify one or more upstream ntp servers as an array."
#
# === Variables
#
# Here you should define a list of variables that this module would require.
#
# [*sample_variable*]
#   Explanation of how this variable affects the funtion of this class and if
#   it has a default. e.g. "The parameter enc_ntp_servers must be set by the
#   External Node Classifier as a comma separated list of hostnames." (Note,
#   global variables should be avoided in favor of class parameters as
#   of Puppet 2.6.)
#
# === Examples
#
#  class { entropy:
#    servers => [ 'pool.ntp.org', 'ntp.local.company.com' ],
#  }
#
# === Authors
#
# Stepan Stipl <stepan@stipl.net>
#
# === Copyright
#
# Copyright 2014 Stepan Stipl
#
class entropy (
  $ensure          = $entropy::params::ensure,

) inherits stunnel::params {

  validate_re( $ensure, '^(present|absent)$')

  anchor {'entropy::begin': }  ->
  class {'entropy::install': } ->
  class {'entropy::config': }  ->
  class {'entropy::service': } ->
  anchor {'entropy::end': }

}
