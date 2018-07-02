# == Class: crypto_win::hashes::sha256
class crypto_win::hashes::sha256 {

  if $crypto_win::sha256 {
    $sha256_enabled = 4294967295
  } else {
    $sha256_enabled = 0
  }

  registry::value { 'Enabled':
    key  => 'HKLM\SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Hashes\SHA256',
    data => $sha256_enabled,
  }

}
