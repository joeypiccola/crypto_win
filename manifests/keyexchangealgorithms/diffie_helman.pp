# == Class: crypto_win::keyexchangealgorithms::diffie_hellman
class crypto_win::keyexchangealgorithms::diffie_hellman {

  if $crypto_win::diffie_hellman {
    $diffie_hellman_enabled = 4294967295
  } else {
    $diffie_hellman_enabled = 0
  }

  registry::value { 'Enabled':
    key  => 'HKLM\SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL\KeyExchangeAlgorithms\Diffie-Hellman',
    data => $diffie_hellman_enabled,
  }

}
