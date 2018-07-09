require 'spec_helper'

describe 'crypto_win::keyexchangealgorithms::diffie_hellman' do
  let :pre_condition do
    'include ::crypto_win'
  end

  on_supported_os(facterversion: '2.4').each do |os, os_facts|
    context "on #{os}" do
      let(:facts) { os_facts }

      context 'passes with minimal params' do
        it {
          is_expected.to contain_registry_key('diffie_hellman').with(
            'ensure' => 'present',
            'path'   => 'HKLM\SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL\KeyExchangeAlgorithms\Diffie-Hellman',
          )
        }

        it {
          is_expected.to contain_registry_value('diffie_hellman_enabled').with(
            'ensure' => 'present',
            'path'   => 'HKLM\SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL\KeyExchangeAlgorithms\Diffie-Hellman\Enabled',
            'type'   => 'dword',
            'data'   => 0xFFFFFFFF,
          )
        }

        it { is_expected.to compile }
      end
    end
  end
end
