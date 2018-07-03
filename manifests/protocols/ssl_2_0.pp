# == Class: crypto_win::protocols::ssl_2_0
class crypto_win::protocols::ssl_2_0 {

  if $crypto_win::ssl_2_0_client {
    $ssl_2_0_client_disabledbydefault = 0
    $ssl_2_0_client_enabled = 4294967295
  } else {
    $ssl_2_0_client_disabledbydefault = 1
    $ssl_2_0_client_enabled = 0
  }

  if $crypto_win::ssl_2_0_server {
    $ssl_2_0_server_disabledbydefault = 0
    $ssl_2_0_server_enabled = 4294967295
  } else {
    $ssl_2_0_server_disabledbydefault = 1
    $ssl_2_0_server_enabled = 0
  }

  # root key
  registry_key { 'ssl_2_0':
      ensure => present,
      path   => 'HKLM\SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Protocols\SSL 2.0',
  }
  # client and serves keys
  registry_key { 'ssl_2_0_client':
      ensure  => present,
      path    => 'HKLM\SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Protocols\SSL 2.0\Client',
      require => Registry_key['ssl_2_0'],
  }
  registry_key { 'ssl_2_0_server':
      ensure  => present,
      path    => 'HKLM\SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Protocols\SSL 2.0\Server',
      require => Registry_key['ssl_2_0'],
  }
  # client values
  registry_value { 'ssl_2_0_client_DisabledByDefault':
    ensure  => present,
    path    => 'HKLM\SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Protocols\SSL 2.0\Client\DisabledByDefault',
    type    => dword,
    data    => $ssl_2_0_client_disabledbydefault,
    require => Registry_key['ssl_2_0_client'],
  }
  registry_value { 'ssl_2_0_client_Enabled':
    ensure  => present,
    path    => 'HKLM\SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Protocols\SSL 2.0\Client\Enabled',
    type    => dword,
    data    => $ssl_2_0_client_enabled,
    require => Registry_key['ssl_2_0_client'],
  }
  # server values
  registry_value { 'ssl_2_0_server_DisabledByDefault':
    ensure  => present,
    path    => 'HKLM\SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Protocols\SSL 2.0\Server\DisabledByDefault',
    type    => dword,
    data    => $ssl_2_0_server_disabledbydefault,
    require => Registry_key['ssl_2_0_server'],
  }
  registry_value { 'ssl_2_0_server_Enabled':
    ensure  => present,
    path    => 'HKLM\SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Protocols\SSL 2.0\Server\Enabled',
    type    => dword,
    data    => $ssl_2_0_server_enabled,
    require => Registry_key['ssl_2_0_server'],
  }

}
