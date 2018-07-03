# == Class: crypto_win::event_logging
class crypto_win::event_logging {

  if $crypto_win::event_logging {
    $event_logging_enabled = 0
  } else {
    $event_logging_enabled = 7
  }

  registry_value { 'EventLogging':
    ensure => present,
    path   => 'HKLM\SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL\EventLogging',
    type   => dword,
    data   => $event_logging_enabled,
  }

}
