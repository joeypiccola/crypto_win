
# crypto_win

Manage cryptographic settings on a Windows machine.

## Parameters

### Logging
 * ``` event_logging  ``` - Set Schannel event logging. Defaults to `true`.

### Protocols
 * ``` multi_client   ``` - Set Multi-Protocol Unified Hello client protocol. Defaults to `false`.
 * ``` multi_server   ``` - Set Multi-Protocol Unified Hello server protocol. Defaults to `false`.
 * ``` tls_1_0_client ``` - Set TLS 1.0 client protocol. Defaults to `false`.
 * ``` tls_1_0_server ``` - Set TLS 1.0 server protocol. Defaults to `false`.
 * ``` tls_1_1_client ``` - Set TLS 1.1 client protocol. Defaults to `false`.
 * ``` tls_1_1_server ``` - Set TLS 1.1 server protocol. Defaults to `false`.
 * ``` tls_1_2_client ``` - Set TLS 1.2 client protocol. Defaults to `true`.
 * ``` tls_1_2_server ``` - Set TLS 1.2 server protocol. Defaults to `true`.
 * ``` ssl_2_0_client ``` - Set SSL 2.0 client protocol. Defaults to `false`.
 * ``` ssl_2_0_server ``` - Set SSL 2.0 server protocol. Defaults to `false`.
 * ``` ssl_3_0_client ``` - Set SSL 3.0 client protocol. Defaults to `false`.
 * ``` ssl_3_0_server ``` - Set SSL 3.0 server protocol. Defaults to `false`.
 * ``` pct_1_0_client ``` - Set PCT 1.0 client protocol. Defaults to `false`.
 * ``` pct_1_0_server ``` - Set PCT 1.0 server protocol. Defaults to `false`.

### Hashes
 * ``` md5            ``` - Set MD5 hash. Defaults to `false`.
 * ``` sha            ``` - Set SHA hash. Defaults to `false`.
 * ``` sha256         ``` - Set SHA256 hash. Defaults to `true`.
 * ``` sha384         ``` - Set SHA384 hash. Defaults to `true`.
 * ``` sha512         ``` - Set SHA512 hash. Defaults to `true`.

### Key Exchange Algorithms
 * ``` pkcs           ``` - Set PKCS key exchange algorithm. Defaults to `true`.
 * ``` ecdh           ``` - Set ECDH key exchange algorithm. Default to `true`.
 * ``` diffie_hellman ``` - Set Diffie-Hellman key exchange algorithm. Default to `true`.

### Ciphers
 * ``` aes_128_128    ``` - Set AES 128/128 cipher. Defaults to `true`.
 * ``` aes_256_256    ``` - Set AES 256/256 cipher. Defaults to `true`.
 * ``` rc2_40_128     ``` - Set RC2 40/128 cipher. Defaults to `false`.
 * ``` rc2_56_128     ``` - Set RC2 56/128 cipher. Defaults to `false`.
 * ``` rc2_128_128    ``` - Set RC2 128/128 cipher. Defaults to `false`.
 * ``` rc4_40_128     ``` - Set RC4 40/128 cipher. Defaults to `false`.
 * ``` rc4_56_128     ``` - Set RC4 56/128 cipher. Defaults to `false`.
 * ``` rc4_64_128     ``` - Set RC4 64/128 cipher. Defaults to `false`.
 * ``` rc4_128_128    ``` - Set RC4 128/128 cipher. Defaults to `false`.
 * ``` des_56_56      ``` - Set DES 56/56 cipher. Defaults to `false`.
 * ``` threedes_168   ``` - Set 3DES 168 cipher. Defaults to `false`.
 * ``` null           ``` - Set NULL cipher. Defaults to `false`.

### Cipher Suits
[COMING SOON, WIP]

## Defaults
Below are the defaults for `crypto_win`.

|Logging|Protocols|Hashes|Key Exchange Algorithms|Ciphers|
|---|---|---|---|---|
|true|TLS 1.2 client & server|SHA256, SHA384, SHA512|PKCS, ECDH, Diffie-Hellman|AES 128/128, AES 256/256|

## Usage
At a minimum include the `crypto_win` class.

## Example
To use all defaults simply include the class.

```
include crypto_win
```

To override a default simply supply the parameter and respective boolean.
```
class { 'crypto_win':
  tls_1_1_client => true,
  tls_1_1_server => true,
  md5            => true,
  ecdh           => false,
}
```