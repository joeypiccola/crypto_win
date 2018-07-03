# == Class: crypto_win::protocols::tls_1_0
class crypto_win::protocols::tls_1_0 {

  if $crypto_win::tls_1_0_client {
    $tls_1_0_client_disabledbydefault = 0
    $tls_1_0_client_enabled = 0xFFFFFFFF
  } else {
    $tls_1_0_client_disabledbydefault = 1
    $tls_1_0_client_enabled = 0
  }

  if $crypto_win::tls_1_0_server {
    $tls_1_0_server_disabledbydefault = 0
    $tls_1_0_server_enabled = 0xFFFFFFFF
  } else {
    $tls_1_0_server_disabledbydefault = 1
    $tls_1_0_server_enabled = 0
  }

  # root key
  registry_key { 'tls_1_0':
      ensure => present,
      path   => 'HKLM\SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Protocols\TLS 1.0',
  }
  # client and serves keys
  registry_key { 'tls_1_0_client':
      ensure  => present,
      path    => 'HKLM\SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Protocols\TLS 1.0\Client',
      require => Registry_key['tls_1_0'],
  }
  registry_key { 'tls_1_0_server':
      ensure  => present,
      path    => 'HKLM\SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Protocols\TLS 1.0\Server',
      require => Registry_key['tls_1_0'],
  }
  # client values
  registry_value { 'tls_1_0_client_DisabledByDefault':
    ensure  => present,
    path    => 'HKLM\SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Protocols\TLS 1.0\Client\DisabledByDefault',
    type    => dword,
    data    => $tls_1_0_client_disabledbydefault,
    require => Registry_key['tls_1_0_client'],
  }
  registry_value { 'tls_1_0_client_Enabled':
    ensure  => present,
    path    => 'HKLM\SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Protocols\TLS 1.0\Client\Enabled',
    type    => dword,
    data    => $tls_1_0_client_enabled,
    require => Registry_key['tls_1_0_client'],
  }
  # server values
  registry_value { 'tls_1_0_server_DisabledByDefault':
    ensure  => present,
    path    => 'HKLM\SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Protocols\TLS 1.0\Server\DisabledByDefault',
    type    => dword,
    data    => $tls_1_0_server_disabledbydefault,
    require => Registry_key['tls_1_0_server'],
  }
  registry_value { 'tls_1_0_server_Enabled':
    ensure  => present,
    path    => 'HKLM\SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Protocols\TLS 1.0\Server\Enabled',
    type    => dword,
    data    => $tls_1_0_server_enabled,
    require => Registry_key['tls_1_0_server'],
  }

}
