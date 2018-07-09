require 'spec_helper'

describe 'crypto_win::protocols::tls_1_0' do
  let :pre_condition do
    'include ::crypto_win'
  end

  on_supported_os(facterversion: '2.4').each do |os, os_facts|
    context "on #{os}" do
      let(:facts) { os_facts }

      context 'passes with minimal params' do
        it {
          is_expected.to contain_registry_key('tls_1_0').with(
            'ensure' => 'present',
            'path'   => 'HKLM\SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Protocols\TLS 1.0',
          )
        }

        it {
          is_expected.to contain_registry_key('tls_1_0_client').with(
            'ensure' => 'present',
            'path'   => 'HKLM\SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Protocols\TLS 1.0\Client',
          )
        }

        it {
          is_expected.to contain_registry_key('tls_1_0_server').with(
            'ensure' => 'present',
            'path'   => 'HKLM\SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Protocols\TLS 1.0\Server',
          )
        }

        it {
          is_expected.to contain_registry_value('tls_1_0_client_DisabledByDefault').with(
            'ensure' => 'present',
            'path'   => 'HKLM\SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Protocols\TLS 1.0\Client\DisabledByDefault',
            'type'   => 'dword',
            'data'   => 1,
          )
        }

        it {
          is_expected.to contain_registry_value('tls_1_0_client_Enabled').with(
            'ensure' => 'present',
            'path'   => 'HKLM\SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Protocols\TLS 1.0\Client\Enabled',
            'type'   => 'dword',
            'data'   => 0,
          )
        }

        it {
          is_expected.to contain_registry_value('tls_1_0_server_DisabledByDefault').with(
            'ensure' => 'present',
            'path'   => 'HKLM\SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Protocols\TLS 1.0\Server\DisabledByDefault',
            'type'   => 'dword',
            'data'   => 1,
          )
        }

        it {
          is_expected.to contain_registry_value('tls_1_0_server_Enabled').with(
            'ensure' => 'present',
            'path'   => 'HKLM\SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Protocols\TLS 1.0\Server\Enabled',
            'type'   => 'dword',
            'data'   => 0,
          )
        }

        it { is_expected.to compile }
      end
    end
  end
end
