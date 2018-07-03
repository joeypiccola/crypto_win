# == Class: crypto_win::ciphers::aes_256_256
class crypto_win::ciphers::aes_256_256 {

  if $crypto_win::aes_256_256 {
    $aes_256_256_enabled = 4294967295
  } else {
    $aes_256_256_enabled = 0
  }

  registry_key { 'aes_256_256':
    ensure => present,
    path   => 'HKLM\SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Ciphers\AES 256/256',
  }
  registry_value { 'aes_256_256_enabled':
    ensure  => present,
    path    => 'HKLM\SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Ciphers\AES 256/256\Enabled',
    type    => string,
    data    => $aes_256_256_enabled,
    require => Registry_key['aes_256_256'],
  }

}
