# == Class: crypto_win::ciphers::threedes_168
class crypto_win::ciphers::threedes_168 {

  if $crypto_win::threedes_168 {
    $threedes_168_enabled = 4294967295
  } else {
    $threedes_168_enabled = 0
  }

  registry_key { 'threedes_168':
    ensure => present,
    path   => 'HKLM\SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Ciphers\Triple DES 168',
  }
  registry_value { 'threedes_168_enabled':
    ensure  => present,
    path    => 'HKLM\SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Ciphers\Triple DES 168\Enabled',
    type    => dword,
    data    => $threedes_168_enabled,
    require => Registry_key['threedes_168'],
  }

}
