require 'spec_helper'

describe 'crypto_win::hashes::sha384' do
  let :pre_condition do
    'include ::crypto_win'
  end

  on_supported_os(facterversion: '2.4').each do |os, os_facts|
    context "on #{os}" do
      let(:facts) { os_facts }

      context 'passes with minimal params' do
        it {
          is_expected.to contain_registry_key('sha384').with(
            'ensure' => 'present',
            'path'   => 'HKLM\SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Hashes\SHA384',
          )
        }

        it {
          is_expected.to contain_registry_value('sha384_enabled').with(
            'ensure' => 'present',
            'path'   => 'HKLM\SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Hashes\SHA384\Enabled',
            'type'   => 'dword',
            'data'   => 0xFFFFFFFF,
          )
        }

        it { is_expected.to compile }
      end
    end
  end
end
