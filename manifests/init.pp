# == Class: crypto_win
class crypto_win (

  Integer[0,7] $event_logging_level = 3,
  Boolean $multi_client             = false,
  Boolean $multi_server             = false,
  Boolean $tls_1_0_client           = false,
  Boolean $tls_1_0_server           = false,
  Boolean $tls_1_1_client           = false,
  Boolean $tls_1_1_server           = false,
  Boolean $tls_1_2_client           = true,
  Boolean $tls_1_2_server           = true,
  Boolean $ssl_2_0_client           = false,
  Boolean $ssl_2_0_server           = false,
  Boolean $ssl_3_0_client           = false,
  Boolean $ssl_3_0_server           = false,
  Boolean $pct_1_0_client           = false,
  Boolean $pct_1_0_server           = false,
  Boolean $md5                      = false,
  Boolean $sha                      = false,
  Boolean $sha256                   = true,
  Boolean $sha384                   = true,
  Boolean $sha512                   = true,
  Boolean $pkcs                     = true,
  Boolean $ecdh                     = true,
  Boolean $diffie_hellman           = true,
  Boolean $aes_128_128              = true,
  Boolean $aes_256_256              = true,
  Boolean $rc2_40_128               = false,
  Boolean $rc2_56_128               = false,
  Boolean $rc2_128_128              = false,
  Boolean $rc4_40_128               = false,
  Boolean $rc4_56_128               = false,
  Boolean $rc4_64_128               = false,
  Boolean $rc4_128_128              = false,
  Boolean $des_56_56                = false,
  Boolean $threedes_168             = false,
  Boolean $null                     = false,

) {

  include crypto_win::event_logging

  include crypto_win::protocols::multi
  include crypto_win::protocols::ssl_2_0
  include crypto_win::protocols::ssl_3_0
  include crypto_win::protocols::tls_1_0
  include crypto_win::protocols::tls_1_1
  include crypto_win::protocols::tls_1_2
  include crypto_win::protocols::pct_1_0

  include crypto_win::hashes::md5
  include crypto_win::hashes::sha
  include crypto_win::hashes::sha256
  include crypto_win::hashes::sha384
  include crypto_win::hashes::sha512

  include crypto_win::keyexchangealgorithms::pkcs
  include crypto_win::keyexchangealgorithms::ecdh
  include crypto_win::keyexchangealgorithms::diffie_hellman

  include crypto_win::ciphers::aes_128_128
  include crypto_win::ciphers::aes_256_256
  include crypto_win::ciphers::rc2_40_128
  include crypto_win::ciphers::rc2_56_128
  include crypto_win::ciphers::rc2_128_128
  include crypto_win::ciphers::rc4_40_128
  include crypto_win::ciphers::rc4_56_128
  include crypto_win::ciphers::rc4_64_128
  include crypto_win::ciphers::rc4_128_128
  include crypto_win::ciphers::des_56_56
  include crypto_win::ciphers::threedes_168
  include crypto_win::ciphers::null

}
