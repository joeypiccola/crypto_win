# == Class: crypto_win::ciphers::aes_256_256
class crypto_win::ciphers::aes_256_256 {

  if $crypto_win::aes_256_256 {
    $aes_256_256_enabled = 4294967295
  } else {
    $aes_256_256_enabled = 0
  }

  registry::value { 'Enabled':
    key  => 'HKLM\SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Ciphers\AES 256/256',
    data => $aes_256_256_enabled,
  }

}
