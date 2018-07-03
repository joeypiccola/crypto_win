# == Class: crypto_win::hashes::sha384
class crypto_win::hashes::sha384 {

  if $crypto_win::sha384 {
    $sha384_enabled = 0xFFFFFFFF
  } else {
    $sha384_enabled = 0
  }

  registry_key { 'sha384':
    ensure => present,
    path   => 'HKLM\SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Hashes\SHA384',
  }
  registry_value { 'sha384_enabled':
    ensure  => present,
    path    => 'HKLM\SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Hashes\SHA384\Enabled',
    type    => dword,
    data    => $sha384_enabled,
    require => Registry_key['sha384'],
  }

}
