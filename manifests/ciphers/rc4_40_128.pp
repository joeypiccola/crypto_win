# == Class: crypto_win::ciphers::rc4_40_128
class crypto_win::ciphers::rc4_40_128 {

  if $crypto_win::rc4_40_128 {
    $rc4_40_128_enabled = 4294967295
  } else {
    $rc4_40_128_enabled = 0
  }

  registry_key { 'rc4_40_128':
    ensure => present,
    path   => 'HKLM\SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Ciphers\RC4 40/128',
  }
  registry_value { 'rc4_40_128_enabled':
    ensure  => present,
    path    => 'HKLM\SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Ciphers\RC4 40/128\Enabled',
    type    => string,
    data    => $rc4_40_128_enabled,
    require => Registry_key['rc4_40_128'],
  }

}
