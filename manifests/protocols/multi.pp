# == Class: crypto_win::protocols::multi
class crypto_win::protocols::multi {

  if $crypto_win::multi_client {
    $multi_client_disabledbydefault = 0
    $multi_client_enabled = 4294967295
  } else {
    $multi_client_disabledbydefault = 1
    $multi_client_enabled = 0
  }

  if $crypto_win::multi_server {
    $multi_server_disabledbydefault = 0
    $multi_server_enabled = 4294967295
  } else {
    $multi_server_disabledbydefault = 1
    $multi_server_enabled = 0
  }

  # root key
  registry_key { 'multi':
      ensure => present,
      path   => 'HKLM\SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Protocols\Multi-Protocol Unified Hello',
  }
  # client and serves keys
  registry_key { 'multi_client':
      ensure  => present,
      path    => 'HKLM\SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Protocols\Multi-Protocol Unified Hello\Client',
      require => Registry_key['multi'],
  }
  registry_key { 'multi_server':
      ensure  => present,
      path    => 'HKLM\SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Protocols\Multi-Protocol Unified Hello\Server',
      require => Registry_key['multi'],
  }
  # client values
  registry_value { 'multi_client_DisabledByDefault':
    ensure  => present,
    path    => 'HKLM\SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Protocols\Multi-Protocol Unified Hello\Client\DisabledByDefault',
    type    => dword,
    data    => $multi_client_disabledbydefault,
    require => Registry_key['multi_client'],
  }
  registry_value { 'multi_client_Enabled':
    ensure  => present,
    path    => 'HKLM\SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Protocols\Multi-Protocol Unified Hello\Client\Enabled',
    type    => dword,
    data    => $multi_client_enabled,
    require => Registry_key['multi_client'],
  }
  # server values
  registry_value { 'multi_server_DisabledByDefault':
    ensure  => present,
    path    => 'HKLM\SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Protocols\Multi-Protocol Unified Hello\Server\DisabledByDefault',
    type    => dword,
    data    => $multi_server_disabledbydefault,
    require => Registry_key['multi_server'],
  }
  registry_value { 'multi_server_Enabled':
    ensure  => present,
    path    => 'HKLM\SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Protocols\Multi-Protocol Unified Hello\Server\Enabled',
    type    => dword,
    data    => $multi_server_enabled,
    require => Registry_key['multi_server'],
  }

}
