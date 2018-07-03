# == Class: crypto_win::ciphers::rc4_64_128
class crypto_win::ciphers::rc4_64_128 {

  if $crypto_win::rc4_64_128 {
    $rc4_64_128_enabled = 0xFFFFFFFF
  } else {
    $rc4_64_128_enabled = 0
  }

  registry_key { 'rc4_64_128':
    ensure => present,
    path   => 'HKLM\SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Ciphers\RC4 64/128',
  }
  registry_value { 'rc4_64_128_enabled':
    ensure  => present,
    path    => 'HKLM\SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Ciphers\RC4 64/128\Enabled',
    type    => dword,
    data    => $rc4_64_128_enabled,
    require => Registry_key['rc4_64_128'],
  }

}
