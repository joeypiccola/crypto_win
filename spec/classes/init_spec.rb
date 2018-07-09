require 'spec_helper'

describe 'crypto_win' do
  let :pre_condition do
    'include ::crypto_win'
  end

  on_supported_os(facterversion: '2.4').each do |os, os_facts|
    context "on #{os}" do
      let(:facts) { os_facts }

      context 'passes with minimal params' do
        it { is_expected.to contain_class('crypto_win::event_logging') }
        it { is_expected.to contain_class('crypto_win::protocols::multi') }
        it { is_expected.to contain_class('crypto_win::protocols::ssl_2_0') }
        it { is_expected.to contain_class('crypto_win::protocols::ssl_3_0') }
        it { is_expected.to contain_class('crypto_win::protocols::tls_1_0') }
        it { is_expected.to contain_class('crypto_win::protocols::tls_1_1') }
        it { is_expected.to contain_class('crypto_win::protocols::tls_1_2') }
        it { is_expected.to contain_class('crypto_win::protocols::pct_1_0') }
        it { is_expected.to contain_class('crypto_win::hashes::md5') }
        it { is_expected.to contain_class('crypto_win::hashes::sha') }
        it { is_expected.to contain_class('crypto_win::hashes::sha256') }
        it { is_expected.to contain_class('crypto_win::hashes::sha384') }
        it { is_expected.to contain_class('crypto_win::hashes::sha512') }
        it { is_expected.to contain_class('crypto_win::keyexchangealgorithms::pkcs') }
        it { is_expected.to contain_class('crypto_win::keyexchangealgorithms::ecdh') }
        it { is_expected.to contain_class('crypto_win::keyexchangealgorithms::diffie_hellman') }
        it { is_expected.to contain_class('crypto_win::ciphers::aes_128_128') }
        it { is_expected.to contain_class('crypto_win::ciphers::aes_256_256') }
        it { is_expected.to contain_class('crypto_win::ciphers::rc2_40_128') }
        it { is_expected.to contain_class('crypto_win::ciphers::rc2_56_128') }
        it { is_expected.to contain_class('crypto_win::ciphers::rc2_128_128') }
        it { is_expected.to contain_class('crypto_win::ciphers::rc4_40_128') }
        it { is_expected.to contain_class('crypto_win::ciphers::rc4_56_128') }
        it { is_expected.to contain_class('crypto_win::ciphers::rc4_64_128') }
        it { is_expected.to contain_class('crypto_win::ciphers::rc4_128_128') }
        it { is_expected.to contain_class('crypto_win::ciphers::des_56_56') }
        it { is_expected.to contain_class('crypto_win::ciphers::threedes_168') }
        it { is_expected.to contain_class('crypto_win::ciphers::null') }
      end
    end
  end
end
