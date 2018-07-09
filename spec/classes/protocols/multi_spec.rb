require 'spec_helper'

describe 'crypto_win::protocols::multi' do
  let :pre_condition do
    'include ::crypto_win'
  end

  on_supported_os(facterversion: '2.4').each do |os, os_facts|
    context "on #{os}" do
      let(:facts) { os_facts }

      context 'passes with minimal params' do
        it {
          is_expected.to contain_registry_key('multi').with(
            'ensure' => 'present',
            'path'   => 'HKLM\SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Protocols\Multi-Protocol Unified Hello',
          )
        }

        it {
          is_expected.to contain_registry_key('multi_client').with(
            'ensure' => 'present',
            'path'   => 'HKLM\SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Protocols\Multi-Protocol Unified Hello\Client',
          )
        }

        it {
          is_expected.to contain_registry_key('multi_server').with(
            'ensure' => 'present',
            'path'   => 'HKLM\SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Protocols\Multi-Protocol Unified Hello\Server',
          )
        }

        it {
          is_expected.to contain_registry_value('multi_client_DisabledByDefault').with(
            'ensure' => 'present',
            'path'   => 'HKLM\SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Protocols\Multi-Protocol Unified Hello\Client\DisabledByDefault',
            'type'   => 'dword',
            'data'   => 1,
          )
        }

        it {
          is_expected.to contain_registry_value('multi_client_Enabled').with(
            'ensure' => 'present',
            'path'   => 'HKLM\SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Protocols\Multi-Protocol Unified Hello\Client\Enabled',
            'type'   => 'dword',
            'data'   => 0,
          )
        }

        it {
          is_expected.to contain_registry_value('multi_server_DisabledByDefault').with(
            'ensure' => 'present',
            'path'   => 'HKLM\SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Protocols\Multi-Protocol Unified Hello\Server\DisabledByDefault',
            'type'   => 'dword',
            'data'   => 1,
          )
        }

        it {
          is_expected.to contain_registry_value('multi_server_Enabled').with(
            'ensure' => 'present',
            'path'   => 'HKLM\SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Protocols\Multi-Protocol Unified Hello\Server\Enabled',
            'type'   => 'dword',
            'data'   => 0,
          )
        }

        it { is_expected.to compile }
      end
    end
  end
end
