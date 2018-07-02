# == Class: crypto_win::hashes::sha384
class crypto_win::hashes::sha384 {

  if $crypto_win::sha384 {
    $sha384_enabled = 4294967295
  } else {
    $sha384_enabled = 0
  }

  registry::value { 'Enabled':
    key  => 'HKLM\SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Hashes\SHA384',
    data => $sha384_enabled,
  }

}
