# == Class: crypto_win::hashes::sha
class crypto_win::hashes::sha {

  if $crypto_win::sha {
    $sha_enabled = 4294967295
  } else {
    $sha_enabled = 0
  }

  registry_key { 'sha':
    ensure => present,
    path   => 'HKLM\SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Hashes\SHA',
  }
  registry_value { 'sha_enabled':
    ensure  => present,
    path    => 'HKLM\SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Hashes\SHA\Enabled',
    type    => dword,
    data    => $sha_enabled,
    require => Registry_key['sha'],
  }

}
