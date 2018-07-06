require 'spec_helper'

describe 'crypto_win::ciphers::aes_128_128' do
  let :pre_condition do
    'include ::crypto_win'
  end

  on_supported_os(facterversion: '2.4').each do |os, os_facts|
    context "on #{os}" do
      let(:facts) { os_facts }

      context 'passes with minimal params' do
        it {
          is_expected.to contain_registry_key('aes_128_128').with(
            'ensure' => 'present',
            'path'   => 'HKLM\SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Ciphers\AES 128/128',
          )
        }

        it {
          is_expected.to contain_registry_value('aes_128_128_enabled').with(
            'ensure' => 'present',
            'path'   => 'HKLM\SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Ciphers\AES 128/128\Enabled',
            'type'   => 'dword',
            'data'   => 0xFFFFFFFF,
          )#.that_requires(
          #  'registry_key[aes_128_128]',
          #)
        }

        it { is_expected.to compile }
      end
    end
  end
end
