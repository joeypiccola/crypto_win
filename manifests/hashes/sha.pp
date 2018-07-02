# == Class: crypto_win::hashes::sha
class crypto_win::hashes::sha {

  if $crypto_win::sha {
    $sha_enabled = 4294967295
  } else {
    $sha_enabled = 0
  }

  registry::value { 'Enabled':
    key  => 'HKLM\SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Hashes\SHA',
    data => $sha_enabled,
  }

}
