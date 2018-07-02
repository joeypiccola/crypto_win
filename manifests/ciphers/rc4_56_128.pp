# == Class: crypto_win::ciphers::rc4_56_128
class crypto_win::ciphers::rc4_56_128 {

  if $crypto_win::rc4_56_128 {
    $rc4_56_128_enabled = 4294967295
  } else {
    $rc4_56_128_enabled = 0
  }

  registry::value { 'Enabled':
    key  => 'HKLM\SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Ciphers\RC4 56/128',
    data => $rc4_56_128_enabled,
  }

}
