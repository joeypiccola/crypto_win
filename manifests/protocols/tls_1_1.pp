# == Class: crypto_win::protocols::tls_1_1
class crypto_win::protocols::tls_1_1 {

  if $crypto_win::tls_1_1_client {
    $tls_1_1_client_disabledbydefault = 0
    $tls_1_1_client_enabled = 0xFFFFFFFF
  } else {
    $tls_1_1_client_disabledbydefault = 1
    $tls_1_1_client_enabled = 0
  }

  if $crypto_win::tls_1_1_server {
    $tls_1_1_server_disabledbydefault = 0
    $tls_1_1_server_enabled = 0xFFFFFFFF
  } else {
    $tls_1_1_server_disabledbydefault = 1
    $tls_1_1_server_enabled = 0
  }

  # root key
  registry_key { 'tls_1_1':
    ensure => present,
    path   => 'HKLM\SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Protocols\TLS 1.1',
  }
  # client and serves keys
  registry_key { 'tls_1_1_client':
    ensure  => present,
    path    => 'HKLM\SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Protocols\TLS 1.1\Client',
    require => Registry_key['tls_1_1'],
    notify  => Class['crypto_win'],
  }
  registry_key { 'tls_1_1_server':
    ensure  => present,
    path    => 'HKLM\SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Protocols\TLS 1.1\Server',
    require => Registry_key['tls_1_1'],
    notify  => Class['crypto_win'],
  }
  # client values
  registry_value { 'tls_1_1_client_DisabledByDefault':
    ensure  => present,
    path    => 'HKLM\SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Protocols\TLS 1.1\Client\DisabledByDefault',
    type    => dword,
    data    => $tls_1_1_client_disabledbydefault,
    require => Registry_key['tls_1_1_client'],
    notify  => Class['crypto_win'],
  }
  registry_value { 'tls_1_1_client_Enabled':
    ensure  => present,
    path    => 'HKLM\SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Protocols\TLS 1.1\Client\Enabled',
    type    => dword,
    data    => $tls_1_1_client_enabled,
    require => Registry_key['tls_1_1_client'],
    notify  => Class['crypto_win'],
  }
  # server values
  registry_value { 'tls_1_1_server_DisabledByDefault':
    ensure  => present,
    path    => 'HKLM\SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Protocols\TLS 1.1\Server\DisabledByDefault',
    type    => dword,
    data    => $tls_1_1_server_disabledbydefault,
    require => Registry_key['tls_1_1_server'],
    notify  => Class['crypto_win'],
  }
  registry_value { 'tls_1_1_server_Enabled':
    ensure  => present,
    path    => 'HKLM\SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Protocols\TLS 1.1\Server\Enabled',
    type    => dword,
    data    => $tls_1_1_server_enabled,
    require => Registry_key['tls_1_1_server'],
    notify  => Class['crypto_win'],
  }

}
