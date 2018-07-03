# == Class: crypto_win::hashes::md5
class crypto_win::hashes::md5 {

  if $crypto_win::md5 {
    $md5_enabled = 0xFFFFFFFF
  } else {
    $md5_enabled = 0
  }

  registry_key { 'md5':
    ensure => present,
    path   => 'HKLM\SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Hashes\MD5',
  }
  registry_value { 'md5_enabled':
    ensure  => present,
    path    => 'HKLM\SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Hashes\MD5\Enabled',
    type    => dword,
    data    => $md5_enabled,
    require => Registry_key['md5'],
  }

}
