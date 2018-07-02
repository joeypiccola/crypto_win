# == Class: crypto_win::ciphers::rc4_40_128
class crypto_win::ciphers::rc4_40_128 {

  if $crypto_win::rc4_40_128 {
    $rc4_40_128_enabled = 4294967295
  } else {
    $rc4_40_128_enabled = 0
  }

  registry::value { 'Enabled':
    key  => 'HKLM\SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Ciphers\RC4 40/128',
    data => $rc4_40_128_enabled,
  }

}
