# == Class: crypto_win::event_logging
class crypto_win::event_logging {

  registry_value { 'EventLogging':
    ensure => present,
    path   => 'HKLM\SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL\EventLogging',
    type   => dword,
    data   => $crypto_win::event_logging_level,
  }

}
