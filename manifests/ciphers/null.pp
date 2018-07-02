# == Class: crypto_win::ciphers::null
class crypto_win::ciphers::null {

  if $crypto_win::null {
    $null_enabled = 4294967295
  } else {
    $null_enabled = 0
  }

  registry::value { 'Enabled':
    key  => 'HKLM\SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Ciphers\NULL',
    data => $null_enabled,
  }

}
