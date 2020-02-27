# == Class: crypto_win::ciphers::aes_128_128
class crypto_win::ciphers::aes_128_128 {

  if $crypto_win::aes_128_128 {
    $aes_128_128_enabled = 0xFFFFFFFF
  } else {
    $aes_128_128_enabled = 0
  }

  registry_key { 'aes_128_128':
    ensure => present,
    path   => 'HKLM\SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Ciphers\AES 128/128',
  }
  registry_value { 'aes_128_128_enabled':
    ensure  => present,
    path    => 'HKLM\SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Ciphers\AES 128/128\Enabled',
    type    => dword,
    data    => $aes_128_128_enabled,
    require => Registry_key['aes_128_128'],
    notify  => Class['crypto_win'],
  }

}
