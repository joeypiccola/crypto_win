# == Class: crypto_win::hashes::sha256
class crypto_win::hashes::sha256 {

  if $crypto_win::sha256 {
    $sha256_enabled = 0xFFFFFFFF
  } else {
    $sha256_enabled = 0
  }

  registry_key { 'sha256':
    ensure => present,
    path   => 'HKLM\SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Hashes\SHA256',
  }
  registry_value { 'sha256_enabled':
    ensure  => present,
    path    => 'HKLM\SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Hashes\SHA256\Enabled',
    type    => dword,
    data    => $sha256_enabled,
    require => Registry_key['sha256'],
    notify  => Class['crypto_win'],
  }

}
