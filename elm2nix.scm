(define-module (elm2nix)
  #:use-module (gnu)
  #:use-module (guix)
  #:use-module (guix build-system haskell)
  #:use-module (guix licenses)
  #:use-module (guix packages)
  #:use-module (gnu packages haskell)
  #:use-module (gnu packages haskell-check)
  #:use-module (gnu packages haskell-crypto)
  #:use-module (gnu packages haskell-web)

  #:use-module (elm)
  #:use-module (control)) ; from guix-postgrest

(define-public elm2nix
  (package
    (name "elm2nix")
    (version "0.1.1")
    (source
      (origin
        (method url-fetch)
        (uri (string-append
               "https://hackage.haskell.org/package/elm2nix/elm2nix-"
               version
               ".tar.gz"))
        (sha256
          (base32
            "16b7vv7ndn8mpkg05rhljpmld2dazsgl9yqg8j3mza1f5x4f6jwp"))))
    (build-system haskell-build-system)
    (inputs
      `(("ghc-aeson" ,ghc-aeson)
        ("ghc-async" ,ghc-async)
        ("ghc-data-default" ,ghc-data-default)
        ("ghc-here" ,ghc-here)
        ("ghc-req" ,ghc-req)
        ("ghc-unordered-containers"
         ,ghc-unordered-containers)
        ("ghc-optparse-applicative"
         ,ghc-optparse-applicative)
        ("ghc-ansi-wl-pprint" ,ghc-ansi-wl-pprint)))
    (home-page
      "https://github.com/domenkozar/elm2nix#readme")
    (synopsis
      "Turn your Elm project into buildable Nix project")
    (description
      "Please see the README on Github at <https://github.com/domenkozar/elm2nix#readme>")
    (license bsd-3)))

(define-public ghc-here
  (package
    (name "ghc-here")
    (version "1.2.13")
    (source
      (origin
        (method url-fetch)
        (uri (string-append
               "https://hackage.haskell.org/package/here/here-"
               version
               ".tar.gz"))
        (sha256
          (base32
            "001wfyvigl2xswqysnpignkl124hybf833875mkcsn8yp8krqvs0"))))
    (build-system haskell-build-system)
    (inputs
      `(("ghc-haskell-src-meta" ,ghc-haskell-src-meta)))
    (home-page "https://github.com/tmhedberg/here")
    (synopsis
      "Here docs & interpolated strings via quasiquotation")
    (description
      "Here docs & interpolated strings via quasiquotation")
    (license bsd-3)))

(define-public ghc-authenticate-oauth
  (package
    (name "ghc-authenticate-oauth")
    (version "1.6")
    (source
      (origin
        (method url-fetch)
        (uri (string-append
               "https://hackage.haskell.org/package/authenticate-oauth/authenticate-oauth-"
               version
               ".tar.gz"))
        (sha256
          (base32
            "0xc37yql79r9idjfdhzg85syrwwgaxggcv86myi6zq2pzl89yvfj"))))
    (build-system haskell-build-system)
    (inputs
      `(("ghc-http-client" ,ghc-http-client)
        ("ghc-crypto-pubkey-types"
         ,ghc-crypto-pubkey-types)
        ("ghc-rsa" ,ghc-rsa)
        ("ghc-data-default" ,ghc-data-default)
        ("ghc-base64-bytestring" ,ghc-base64-bytestring)
        ("ghc-sha" ,ghc-sha)
        ("ghc-random" ,ghc-random)
        ("ghc-http-types" ,ghc-http-types)
        ("ghc-blaze-builder" ,ghc-blaze-builder)
        ("ghc-transformers-compat"
         ,ghc-transformers-compat)))
    (arguments
      `(#:cabal-revision
        ("1"
         "1fxwn8bn6qs8dhxq0q04psq7zp1qvw1b6g3vmsclgyj9p7kr77ms")))
    (home-page
      "http://github.com/yesodweb/authenticate")
    (synopsis
      "Library to authenticate with OAuth for Haskell web applications.")
    (description
      "API docs and the README are available at <http://www.stackage.org/package/authenticate-oauth>.")
    (license bsd-3)))

(define-public ghc-crypto-pubkey-types
  (package
    (name "ghc-crypto-pubkey-types")
    (version "0.4.3")
    (source
      (origin
        (method url-fetch)
        (uri (string-append
               "https://hackage.haskell.org/package/crypto-pubkey-types/crypto-pubkey-types-"
               version
               ".tar.gz"))
        (sha256
          (base32
            "0q0wlzjmpx536h1zcdzrpxjkvqw8abj8z0ci38138kpch4igbnby"))))
    (build-system haskell-build-system)
    (inputs
      `(("ghc-asn1-types" ,ghc-asn1-types)
        ("ghc-asn1-encoding" ,ghc-asn1-encoding)))
    (home-page
      "http://github.com/vincenthz/hs-crypto-pubkey-types")
    (synopsis
      "Generic cryptography Public keys algorithm types")
    (description
      "Generic cryptography public keys algorithm types")
    (license bsd-3)))

(define-public ghc-rsa
  (package
    (name "ghc-rsa")
    (version "2.3.1")
    (source
      (origin
        (method url-fetch)
        (uri (string-append
               "https://hackage.haskell.org/package/RSA/RSA-"
               version
               ".tar.gz"))
        (sha256
          (base32
            "06k7nd7b1rdfb7891gw9bihrd9ripffbgqa14q1ryyj6vqa9r4jw"))))
    (build-system haskell-build-system)
    (inputs
      `(("ghc-crypto-api" ,ghc-crypto-api)
        ("ghc-crypto-pubkey-types"
         ,ghc-crypto-pubkey-types)
        ("ghc-sha" ,ghc-sha)))
    (native-inputs
      `(("ghc-drbg" ,ghc-drbg)
        ("ghc-quickcheck" ,ghc-quickcheck)
        ("ghc-tagged" ,ghc-tagged)
        ("ghc-test-framework" ,ghc-test-framework)
        ("ghc-test-framework-quickcheck2"
         ,ghc-test-framework-quickcheck2)))
    (home-page
      "http://hackage.haskell.org/package/RSA")
    (synopsis
      "Implementation of RSA, using the padding schemes of PKCS#1 v2.1.")
    (description
      "This library implements the RSA encryption and signature algorithms for arbitrarily-sized ByteStrings. While the implementations work, they are not necessarily the fastest ones on the planet. Particularly key generation. The algorithms included are based of RFC 3447, or the Public-Key Cryptography Standard for RSA, version 2.1 (a.k.a, PKCS#1 v2.1).")
    (license bsd-3)))

(define-public ghc-drbg
  (package
    (name "ghc-drbg")
    (version "0.5.5")
    (source
      (origin
        (method url-fetch)
        (uri (string-append
               "https://hackage.haskell.org/package/DRBG/DRBG-"
               version
               ".tar.gz"))
        (sha256
          (base32
            "1z9vqc1nw0mf2sqgddcipmlkz6mckq9wnrzqqdy3rj3c90135pr1"))
        (patches
         (search-patches "ghc-drbg-remove-ctr.patch"))))
    (build-system haskell-build-system)
    (inputs
      `(("ghc-cereal" ,ghc-cereal)
        ("ghc-prettyclass" ,ghc-prettyclass)
        ("ghc-tagged" ,ghc-tagged)
        ("ghc-crypto-api" ,ghc-crypto-api)
        ("ghc-cryptohash-cryptoapi"
         ,ghc-cryptohash-cryptoapi)
        ("ghc-parallel" ,ghc-parallel)
        ("ghc-cipher-aes128" ,ghc-cipher-aes128)
        ("ghc-entropy" ,ghc-entropy)))
    (native-inputs
      `(("ghc-quickcheck" ,ghc-quickcheck)
        ("ghc-crypto-api-tests" ,ghc-crypto-api-tests)
        ("ghc-hunit" ,ghc-hunit)
        ("ghc-test-framework" ,ghc-test-framework)
        ("ghc-test-framework-hunit"
         ,ghc-test-framework-hunit)))
    (home-page
      "http://hackage.haskell.org/package/DRBG")
    (synopsis
      "Deterministic random bit generator (aka RNG, PRNG) based HMACs, Hashes, and Ciphers.")
    (description "Cryptographically secure RNGs")
    (license bsd-3)))

(define-public ghc-cryptohash-cryptoapi
  (package
    (name "ghc-cryptohash-cryptoapi")
    (version "0.1.4")
    (source
      (origin
        (method url-fetch)
        (uri (string-append
               "https://hackage.haskell.org/package/cryptohash-cryptoapi/cryptohash-cryptoapi-"
               version
               ".tar.gz"))
        (sha256
          (base32
            "13h5f9pmcd0swa4asl7wzpf5lskpgjdqrmy1mqdc78gsxdj8cyki"))))
    (build-system haskell-build-system)
    (inputs
      `(("ghc-memory" ,ghc-memory)
        ("ghc-cryptonite" ,ghc-cryptonite)
        ("ghc-crypto-api" ,ghc-crypto-api)
        ("ghc-tagged" ,ghc-tagged)
        ("ghc-cereal" ,ghc-cereal)))
    (home-page
      "https://github.com/vincenthz/hs-cryptohash-cryptoapi")
    (synopsis "Crypto-api interfaces for cryptohash")
    (description
      "Crypto-api interfaces for cryptohash")
    (license bsd-3)))

(define-public ghc-cipher-aes128
  (package
    (name "ghc-cipher-aes128")
    (version "0.7.0.4")
    (source
      (origin
        (method url-fetch)
        (uri (string-append
               "https://hackage.haskell.org/package/cipher-aes128/cipher-aes128-"
               version
               ".tar.gz"))
        (sha256
          (base32
            "1182s7984zjxz53nnjyki5afhfq8h5wjfmg6cqy9z0x1q63qk3fd"))))
    (build-system haskell-build-system)
    (inputs
      `(("ghc-crypto-api" ,ghc-crypto-api)
        ("ghc-tagged" ,ghc-tagged)
        ("ghc-cereal" ,ghc-cereal)))
    (home-page
      "https://github.com/TomMD/cipher-aes128")
    (synopsis
      "AES and common modes using AES-NI when available.")
    (description
      "Cipher-aes128 is an implementation of AES and common modes of operation.  It borrows Hanquez's C AES code (see 'cipher-aes') but is unique due to including compile-time detection of NI compiler support, a slightly more functional interface for GCM operations, exposure of 'Ptr' based operations via the .Internal module, and build-in crypto-api support. Cipher-aes128 was originally developed as \"'cipher-aes' plus trampolines\", which has since been adopted into cipher-aes.")
    (license bsd-3)))

(define-public ghc-req
  (package
    (name "ghc-req")
    (version "1.2.1")
    (source
      (origin
        (method url-fetch)
        (uri (string-append
               "https://hackage.haskell.org/package/req/req-"
               version
               ".tar.gz"))
        (sha256
          (base32
            "1s8gjifc9jixl4551hay013fwyhlamcyrxjb00qr76wwikqa0g8k"))))
    (build-system haskell-build-system)
    (inputs
      `(("ghc-aeson" ,ghc-aeson)
        ("ghc-authenticate-oauth"
         ,ghc-authenticate-oauth)
        ("ghc-blaze-builder" ,ghc-blaze-builder)
        ("ghc-case-insensitive" ,ghc-case-insensitive)
        ("ghc-connection" ,ghc-connection)
        ("ghc-data-default-class"
         ,ghc-data-default-class)
        ("ghc-http-api-data" ,ghc-http-api-data)
        ("ghc-http-client" ,ghc-http-client)
        ("ghc-http-client-tls" ,ghc-http-client-tls)
        ("ghc-http-types" ,ghc-http-types)
        ("ghc-monad-control" ,ghc-monad-control)
        ("ghc-retry" ,ghc-retry)
        ("ghc-transformers-base" ,ghc-transformers-base)))
    (native-inputs
      `(("hspec-discover" ,hspec-discover)
        ("ghc-quickcheck" ,ghc-quickcheck)
        ("ghc-hspec" ,ghc-hspec)
        ("ghc-hspec-core" ,ghc-hspec-core)
        ("ghc-quickcheck" ,ghc-quickcheck)
        ("ghc-hspec" ,ghc-hspec)
        ("ghc-unordered-containers"
         ,ghc-unordered-containers)))
    (arguments
      `(#:cabal-revision
        ("3"
         "1sbm2rk2q56gma2wja47q1rc8a2pizl8487g5z4fy1zynxm5inyj")
        #:phases
        (modify-phases %standard-phases
          (add-before 'configure 'skip-httpbin-tests
            (lambda _
              (substitute* "req.cabal"
                (("test-suite httpbin-tests")
                 "test-suite httpbin-tests\n  buildable: False")))))))
    (home-page "https://github.com/mrkkrp/req")
    (synopsis
      "Easy-to-use, type-safe, expandable, high-level HTTP client library")
    (description
      "Easy-to-use, type-safe, expandable, high-level HTTP client library.")
    (license bsd-3)))
