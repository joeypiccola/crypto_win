# == Class: crypto_win::ciphers::rc2_40_128
class crypto_win::ciphers::rc2_40_128 {

  if $crypto_win::rc2_40_128 {
    $rc2_40_128_enabled = 4294967295
  } else {
    $rc2_40_128_enabled = 0
  }

  registry::value { 'Enabled':
    key  => 'HKLM\SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Ciphers\RC2 40/128',
    data => $rc2_40_128_enabled,
  }

}
