# == Class: crypto_win::hashes::sha512
class crypto_win::hashes::sha512 {

  if $crypto_win::sha512 {
    $sha512_enabled = 0xFFFFFFFF
  } else {
    $sha512_enabled = 0
  }

  registry_key { 'sha512':
    ensure => present,
    path   => 'HKLM\SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Hashes\SHA512',
  }
  registry_value { 'sha512_enabled':
    ensure  => present,
    path    => 'HKLM\SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Hashes\SHA512\Enabled',
    type    => dword,
    data    => $sha512_enabled,
    require => Registry_key['sha512'],
    notify  => Class['crypto_win'],
  }

}
