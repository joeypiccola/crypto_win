# == Class: crypto_win::ciphers::des_56_56
class crypto_win::ciphers::des_56_56 {

  if $crypto_win::des_56_56 {
    $des_56_56_enabled = 0xFFFFFFFF
  } else {
    $des_56_56_enabled = 0
  }

  registry_key { 'des_56_56':
    ensure => present,
    path   => 'HKLM\SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Ciphers\DES 56/56',
  }
  registry_value { 'des_56_56_enabled':
    ensure  => present,
    path    => 'HKLM\SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Ciphers\DES 56/56\Enabled',
    type    => dword,
    data    => $des_56_56_enabled,
    require => Registry_key['des_56_56'],
    notify  => Class['crypto_win'],
  }

}
