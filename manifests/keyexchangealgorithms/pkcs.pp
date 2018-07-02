# == Class: crypto_win::keyexchangealgorithms::pkcs
class crypto_win::keyexchangealgorithms::pkcs {

  if $crypto_win::pkcs {
    $pkcs_enabled = 4294967295
  } else {
    $pkcs_enabled = 0
  }

  registry::value { 'Enabled':
    key  => 'HKLM\SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL\KeyExchangeAlgorithms\PKCS',
    data => $pkcs_enabled,
  }

}
