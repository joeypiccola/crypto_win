# == Class: crypto_win::ciphers::threedes_168
class crypto_win::ciphers::threedes_168 {

  if $crypto_win::threedes_168 {
    $threedes_168_enabled = 4294967295
  } else {
    $threedes_168_enabled = 0
  }

  registry::value { 'Enabled':
    key  => 'HKLM\SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Ciphers\Triple DES 168',
    data => $threedes_168_enabled,
  }

}
