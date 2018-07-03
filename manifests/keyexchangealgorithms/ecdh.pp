# == Class: crypto_win::keyexchangealgorithms::ecdh
class crypto_win::keyexchangealgorithms::ecdh {

  if $crypto_win::ecdh {
    $ecdh_enabled = 4294967295
  } else {
    $ecdh_enabled = 0
  }

  registry_key { 'ecdh':
    ensure => present,
    path   => 'HKLM\SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL\KeyExchangeAlgorithms\ECDH',
  }
  registry_value { 'ecdh_enabled':
    ensure  => present,
    path    => 'HKLM\SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL\KeyExchangeAlgorithms\ECDH\Enabled',
    type    => dword,
    data    => $ecdh_enabled,
    require => Registry_key['ecdh'],
  }

}
