# == Class: crypto_win::keyexchangealgorithms::pkcs
class crypto_win::keyexchangealgorithms::pkcs {

  if $crypto_win::pkcs {
    $pkcs_enabled = 4294967295
  } else {
    $pkcs_enabled = 0
  }

  registry_key { 'pkcs':
    ensure => present,
    path   => 'HKLM\SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL\KeyExchangeAlgorithms\PKCS',
  }
  registry_value { 'pkcs_enabled':
    ensure  => present,
    path    => 'HKLM\SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL\KeyExchangeAlgorithms\PKCS\Enabled',
    type    => string,
    data    => $pkcs_enabled,
    require => Registry_key['pkcs'],
  }

}
