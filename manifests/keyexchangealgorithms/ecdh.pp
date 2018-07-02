# == Class: crypto_win::keyexchangealgorithms::ecdh
class crypto_win::keyexchangealgorithms::ecdh {

  if $crypto_win::ecdh {
    $ecdh_enabled = 4294967295
  } else {
    $ecdh_enabled = 0
  }

  registry::value { 'Enabled':
    key  => 'HKLM\SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL\KeyExchangeAlgorithms\ECDH',
    data => $ecdh_enabled,
  }

}
