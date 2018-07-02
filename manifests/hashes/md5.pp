# == Class: crypto_win::hashes::md5
class crypto_win::hashes::md5 {

  if $crypto_win::md5 {
    $md5_enabled = 4294967295
  } else {
    $md5_enabled = 0
  }

  registry::value { 'Enabled':
    key  => 'HKLM\SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Hashes\MD5',
    data => $md5_enabled,
  }

}
