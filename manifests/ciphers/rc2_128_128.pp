# == Class: crypto_win::ciphers::rc2_128_128
class crypto_win::ciphers::rc2_128_128 {

  if $crypto_win::rc2_128_128 {
    $rc2_128_128_enabled = 0xFFFFFFFF
  } else {
    $rc2_128_128_enabled = 0
  }

  registry_key { 'rc2_128_128':
    ensure => present,
    path   => 'HKLM\SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Ciphers\RC2 128/128',
  }
  registry_value { 'rc2_128_128_enabled':
    ensure  => present,
    path    => 'HKLM\SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Ciphers\RC2 128/128\Enabled',
    type    => dword,
    data    => $rc2_128_128_enabled,
    require => Registry_key['rc2_128_128'],
  }

}
