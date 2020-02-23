# == Class: crypto_win::protocols::tls_1_2
class crypto_win::protocols::tls_1_2 {

  if $crypto_win::tls_1_2_client {
    $tls_1_2_client_disabledbydefault = 0
    $tls_1_2_client_enabled = 0xFFFFFFFF
  } else {
    $tls_1_2_client_disabledbydefault = 1
    $tls_1_2_client_enabled = 0
  }

  if $crypto_win::tls_1_2_server {
    $tls_1_2_server_disabledbydefault = 0
    $tls_1_2_server_enabled = 0xFFFFFFFF
  } else {
    $tls_1_2_server_disabledbydefault = 1
    $tls_1_2_server_enabled = 0
  }

  # root key
  registry_key { 'tls_1_2':
    ensure => present,
    path   => 'HKLM\SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Protocols\TLS 1.2',
  }
  # client and serves keys
  registry_key { 'tls_1_2_client':
    ensure  => present,
    path    => 'HKLM\SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Protocols\TLS 1.2\Client',
    require => Registry_key['tls_1_2'],
    notify  => Class['crypto_win'],
  }
  registry_key { 'tls_1_2_server':
    ensure  => present,
    path    => 'HKLM\SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Protocols\TLS 1.2\Server',
    require => Registry_key['tls_1_2'],
    notify  => Class['crypto_win'],
  }
  # client values
  registry_value { 'tls_1_2_client_DisabledByDefault':
    ensure  => present,
    path    => 'HKLM\SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Protocols\TLS 1.2\Client\DisabledByDefault',
    type    => dword,
    data    => $tls_1_2_client_disabledbydefault,
    require => Registry_key['tls_1_2_client'],
    notify  => Class['crypto_win'],
  }
  registry_value { 'tls_1_2_client_Enabled':
    ensure  => present,
    path    => 'HKLM\SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Protocols\TLS 1.2\Client\Enabled',
    type    => dword,
    data    => $tls_1_2_client_enabled,
    require => Registry_key['tls_1_2_client'],
    notify  => Class['crypto_win'],
  }
  # server values
  registry_value { 'tls_1_2_server_DisabledByDefault':
    ensure  => present,
    path    => 'HKLM\SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Protocols\TLS 1.2\Server\DisabledByDefault',
    type    => dword,
    data    => $tls_1_2_server_disabledbydefault,
    require => Registry_key['tls_1_2_server'],
    notify  => Class['crypto_win'],
  }
  registry_value { 'tls_1_2_server_Enabled':
    ensure  => present,
    path    => 'HKLM\SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Protocols\TLS 1.2\Server\Enabled',
    type    => dword,
    data    => $tls_1_2_server_enabled,
    require => Registry_key['tls_1_2_server'],
    notify  => Class['crypto_win'],
  }

}
