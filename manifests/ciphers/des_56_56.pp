# == Class: crypto_win::ciphers::des_56_56
class crypto_win::ciphers::des_56_56 {

  if $crypto_win::des_56_56 {
    $des_56_56_enabled = 4294967295
  } else {
    $des_56_56_enabled = 0
  }

  registry::value { 'Enabled':
    key  => 'HKLM\SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Ciphers\DES 56/56',
    data => $des_56_56_enabled,
  }

}
