# == Class: crypto_win::protocols::pct_1_0
class crypto_win::protocols::pct_1_0 {

  if $crypto_win::pct_1_0_client {
    $pct_1_0_client_disabledbydefault = 0
    $pct_1_0_client_enabled = 0xFFFFFFFF
  } else {
    $pct_1_0_client_disabledbydefault = 1
    $pct_1_0_client_enabled = 0
  }

  if $crypto_win::pct_1_0_server {
    $pct_1_0_server_disabledbydefault = 0
    $pct_1_0_server_enabled = 0xFFFFFFFF
  } else {
    $pct_1_0_server_disabledbydefault = 1
    $pct_1_0_server_enabled = 0
  }

  # root key
  registry_key { 'pct_1_0':
    ensure => present,
    path   => 'HKLM\SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Protocols\PCT 1.0',
  }
  # client and serves keys
  registry_key { 'pct_1_0_client':
    ensure  => present,
    path    => 'HKLM\SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Protocols\PCT 1.0\Client',
    require => Registry_key['pct_1_0'],
    notify  => Class['crypto_win'],
  }
  registry_key { 'pct_1_0_server':
    ensure  => present,
    path    => 'HKLM\SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Protocols\PCT 1.0\Server',
    require => Registry_key['pct_1_0'],
    notify  => Class['crypto_win'],
  }
  # client values
  registry_value { 'pct_1_0_client_DisabledByDefault':
    ensure  => present,
    path    => 'HKLM\SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Protocols\PCT 1.0\Client\DisabledByDefault',
    type    => dword,
    data    => $pct_1_0_client_disabledbydefault,
    require => Registry_key['pct_1_0_client'],
    notify  => Class['crypto_win'],
  }
  registry_value { 'pct_1_0_client_Enabled':
    ensure  => present,
    path    => 'HKLM\SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Protocols\PCT 1.0\Client\Enabled',
    type    => dword,
    data    => $pct_1_0_client_enabled,
    require => Registry_key['pct_1_0_client'],
    notify  => Class['crypto_win'],
  }
  # server values
  registry_value { 'pct_1_0_server_DisabledByDefault':
    ensure  => present,
    path    => 'HKLM\SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Protocols\PCT 1.0\Server\DisabledByDefault',
    type    => dword,
    data    => $pct_1_0_server_disabledbydefault,
    require => Registry_key['pct_1_0_server'],
    notify  => Class['crypto_win'],
  }
  registry_value { 'pct_1_0_server_Enabled':
    ensure  => present,
    path    => 'HKLM\SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Protocols\PCT 1.0\Server\Enabled',
    type    => dword,
    data    => $pct_1_0_server_enabled,
    require => Registry_key['pct_1_0_server'],
    notify  => Class['crypto_win'],
  }

}
