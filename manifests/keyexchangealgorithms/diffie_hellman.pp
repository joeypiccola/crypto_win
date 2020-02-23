# == Class: crypto_win::keyexchangealgorithms::diffie_hellman
class crypto_win::keyexchangealgorithms::diffie_hellman {

  if $crypto_win::diffie_hellman {
    $diffie_hellman_enabled = 0xFFFFFFFF
  } else {
    $diffie_hellman_enabled = 0
  }

  registry_key { 'diffie_hellman':
    ensure => present,
    path   => 'HKLM\SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL\KeyExchangeAlgorithms\Diffie-Hellman',
  }
  registry_value { 'diffie_hellman_enabled':
    ensure  => present,
    path    => 'HKLM\SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL\KeyExchangeAlgorithms\Diffie-Hellman\Enabled',
    type    => dword,
    data    => $diffie_hellman_enabled,
    require => Registry_key['diffie_hellman'],
    notify  => Class['crypto_win'],
  }

}
