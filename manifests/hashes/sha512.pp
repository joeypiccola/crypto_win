# == Class: crypto_win::hashes::sha512
class crypto_win::hashes::sha512 {

  if $crypto_win::sha512 {
    $sha512_enabled = 4294967295
  } else {
    $sha512_enabled = 0
  }

  registry::value { 'Enabled':
    key  => 'HKLM\SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Hashes\SHA512',
    data => $sha512_enabled,
  }

}
