(define-module (elm)
  #:use-module (gnu)
  #:use-module (guix)
  #:use-module (guix git-download)
  #:use-module (guix build-system haskell)
  #:use-module (guix licenses)
  #:use-module (guix packages)
  #:use-module (gnu packages haskell)
  #:use-module (gnu packages haskell-check)
  #:use-module (gnu packages haskell-crypto)
  #:use-module (gnu packages haskell-web))

(define-public elm-compiler  
  (package
    (name "elm-compiler")
    (version "0.19.0")
    (source
     (origin
       (method url-fetch)
       (uri "https://github.com/elm/compiler/archive/0.19.0.tar.gz")
       (sha256
        (base32 "0g4risrjrvngz3j4wf432j82gjcc8i1b7l5lwbb0fhr24hvz6ka9"))
       (patches
        (search-patches "elm-disable-reactor.patch"
                        "elm-relax-glsl-bound.patch"
                        "elm-fix-map-key.patch"))))
    (build-system haskell-build-system)
    (inputs
     `(("ghc-ansi-terminal" ,ghc-ansi-terminal)
       ("ghc-ansi-wl-pprint" ,ghc-ansi-wl-pprint)
       ("ghc-edit-distance" ,ghc-edit-distance)
       ("ghc-file-embed" ,ghc-file-embed)
       ("ghc-http" ,ghc-http)
       ("ghc-http-client" ,ghc-http-client)
       ("ghc-http-client-tls" ,ghc-http-client-tls)
       ("ghc-http-types" ,ghc-http-types)
       ("ghc-language-glsl" ,ghc-language-glsl)
       ("ghc-logict" ,ghc-logict)
       ("ghc-network" ,ghc-network)
       ("ghc-raw-strings-qq" ,ghc-raw-strings-qq)
       ("ghc-scientific" ,ghc-scientific)
       ("ghc-sha" ,ghc-sha)
       ("ghc-snap-core" ,ghc-snap-core)
       ("ghc-snap-server" ,ghc-snap-server)
       ("ghc-unordered-containers"
        ,ghc-unordered-containers)
       ("ghc-utf8-string" ,ghc-utf8-string)
       ("ghc-vector" ,ghc-vector)
       ("ghc-zip-archive" ,ghc-zip-archive)))
    (home-page "https://elm-lang.org")
    (synopsis "The `elm` command line interface.")
    (description
     "This includes commands like `elm make`, `elm repl`, and many others for helping make Elm developers happy and productive.")
    (license bsd-3)))

(define-public ghc-readable
  (package
    (name "ghc-readable")
    (version "0.3.1")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://hackage.haskell.org/package/readable/readable-"
             version
             ".tar.gz"))
       (sha256
        (base32
         "1ja39cg26wy2fs00gi12x7iq5k8i366pbqi3p916skfa5jnkfc3h"))))
    (build-system haskell-build-system)
    (arguments `(#:tests? #f))
    (home-page
     "https://github.com/mightybyte/readable")
    (synopsis "Reading from Text and ByteString")
    (description
     "Provides a Readable type class for reading data types from ByteString and Text.  Also includes efficient implementations for common data types.")
    (license bsd-3)))

(define-public ghc-snap-core
  (package
    (name "ghc-snap-core")
    (version "1.0.4.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://hackage.haskell.org/package/snap-core/snap-core-"
             version
             ".tar.gz"))
       (sha256
        (base32
         "0dklxgrbqhnb6bc4ic358g4fyj11ywmjrkxxhqcjmci2hhpn00mr"))))
    (build-system haskell-build-system)
    (inputs
     `(("ghc-old-locale" ,ghc-old-locale)
       ("ghc-hunit" ,ghc-hunit)
       ("ghc-attoparsec" ,ghc-attoparsec)
       ("ghc-bytestring-builder"
        ,ghc-bytestring-builder)
       ("ghc-case-insensitive" ,ghc-case-insensitive)
       ("ghc-lifted-base" ,ghc-lifted-base)
       ("ghc-io-streams" ,ghc-io-streams)
       ("ghc-hashable" ,ghc-hashable)
       ("ghc-monad-control" ,ghc-monad-control)
       ("ghc-random" ,ghc-random)
       ("ghc-readable" ,ghc-readable)
       ("ghc-regex-posix" ,ghc-regex-posix)
       ("ghc-transformers-base" ,ghc-transformers-base)
       ("ghc-unix-compat" ,ghc-unix-compat)
       ("ghc-unordered-containers"
        ,ghc-unordered-containers)
       ("ghc-vector" ,ghc-vector)
       ("ghc-network-uri" ,ghc-network-uri)
       ("ghc-network" ,ghc-network)))
    (arguments `(#:tests? #f))
    (home-page "http://snapframework.com/")
    (synopsis
     "Snap: A Haskell Web Framework (core interfaces and types)")
    (description
     "Snap is a simple and fast web development framework and server written in Haskell. For more information or to download the latest version, you can visit the Snap project website at <http://snapframework.com/>. . This library contains the core definitions and types for the Snap framework, including: . 1. Primitive types and functions for HTTP (requests, responses, cookies, post/query parameters, etc) . 2. A monad for programming web handlers called \\\"Snap\\\", which allows: . * Stateful access to the HTTP request and response objects . * Monadic failure (i.e. MonadPlus/Alternative instances) for declining to handle requests and chaining handlers together . * Early termination of the computation if you know early what you want to return and want to prevent further monadic processing . /Quick start/: The 'Snap' monad and HTTP definitions are in \"Snap.Core\".")
    (license bsd-3)))

(define-public ghc-io-streams-haproxy
  (package
    (name "ghc-io-streams-haproxy")
    (version "1.0.1.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://hackage.haskell.org/package/io-streams-haproxy/io-streams-haproxy-"
             version
             ".tar.gz"))
       (sha256
        (base32
         "1dcn5hd4fiwyq7m01r6fi93vfvygca5s6mz87c78m0zyj29clkmp"))))
    (build-system haskell-build-system)
    (inputs
     `(("ghc-attoparsec" ,ghc-attoparsec)
       ("ghc-io-streams" ,ghc-io-streams)
       ("ghc-network" ,ghc-network)))
    (arguments `(#:tests? #f))
    (home-page "http://snapframework.com/")
    (synopsis
     "HAProxy protocol 1.5 support for io-streams")
    (description
     "HAProxy protocol version 1.5 support (see <http://haproxy.1wt.eu/download/1.5/doc/proxy-protocol.txt>) for applications using io-streams. The proxy protocol allows information about a networked peer (like remote address and port) to be propagated through a forwarding proxy that is configured to speak this protocol.")
    (license bsd-3)))

(define-public ghc-zlib-bindings
  (package
    (name "ghc-zlib-bindings")
    (version "0.1.1.5")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://hackage.haskell.org/package/zlib-bindings/zlib-bindings-"
             version
             ".tar.gz"))
       (sha256
        (base32
         "02ciywlz4wdlymgc3jsnicz9kzvymjw1www2163gxidnz4wb8fy8"))))
    (build-system haskell-build-system)
    (inputs `(("ghc-zlib" ,ghc-zlib)))
    (arguments
     `(#:tests?
       #f
       #:cabal-revision
       ("2"
        "0fq49694gqkab8m0vq4i879blswczwd66n7xh4r4gwiahf0ryvqc")))
    (home-page
     "http://github.com/snapframework/zlib-bindings")
    (synopsis
     "Low-level bindings to the zlib package.")
    (description
     "Low-level bindings to the zlib package.")
    (license bsd-3)))

(define-public ghc-io-streams
  (package
    (name "ghc-io-streams")
    (version "1.5.1.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://hackage.haskell.org/package/io-streams/io-streams-"
             version
             ".tar.gz"))
       (sha256
        (base32
         "1c7byr943x41nxpc3bnz152fvfbmakafq2958wyf9qiyp2pz18la"))))
    (build-system haskell-build-system)
    (inputs
     `(("ghc-attoparsec" ,ghc-attoparsec)
       ("ghc-bytestring-builder"
        ,ghc-bytestring-builder)
       ("ghc-network" ,ghc-network)
       ("ghc-primitive" ,ghc-primitive)
       ("ghc-vector" ,ghc-vector)
       ("ghc-zlib-bindings" ,ghc-zlib-bindings)))
    (arguments `(#:tests? #f))
    (home-page
     "http://hackage.haskell.org/package/io-streams")
    (synopsis
     "Simple, composable, and easy-to-use stream I/O")
    (description
     "/Overview/ . The io-streams library contains simple and easy-to-use primitives for I/O using streams. Most users will want to import the top-level convenience module \"System.IO.Streams\", which re-exports most of the library: . @ import           System.IO.Streams (InputStream, OutputStream) import qualified System.IO.Streams as Streams @ . For first-time users, @io-streams@ comes with an included tutorial, which can be found in the \"System.IO.Streams.Tutorial\" module. . /Features/ . The @io-streams@ user API has two basic types: @InputStream a@ and @OutputStream a@, and three fundamental I/O primitives: . @ \\-\\- read an item from an input stream Streams.read :: InputStream a -> IO (Maybe a) . \\-\\- push an item back to an input stream Streams.unRead :: a -> InputStream a -> IO () . \\-\\- write to an output stream Streams.write :: Maybe a -> OutputStream a -> IO () @ . Streams can be transformed by composition and hooked together with provided combinators: . @ ghci> Streams.fromList [1,2,3::Int] >>= Streams.map (*10) >>= Streams.toList [10,20,30] @ . Stream composition leaves the original stream accessible: . @ ghci> input \\<- Streams.fromByteString \\\"long string\\\" ghci> wrapped \\<- Streams.takeBytes 4 input ghci> Streams.read wrapped Just \\\"long\\\" ghci> Streams.read wrapped Nothing ghci> Streams.read input Just \\\" string\\\" @ . Simple types and operations in the IO monad mean straightforward and simple exception handling and resource cleanup using Haskell standard library facilities like 'Control.Exception.bracket'. . @io-streams@ comes with: . * functions to use files, handles, concurrent channels, sockets, lists, vectors, and more as streams. . * a variety of combinators for wrapping and transforming streams, including compression and decompression using zlib, controlling precisely how many bytes are read from or written to a stream, buffering output using bytestring builders, folds, maps, filters, zips, etc. . * support for parsing from streams using @attoparsec@. . * support for spawning processes and communicating with them using streams.")
    (license bsd-3)))

(define-public ghc-snap-server
  (package
    (name "ghc-snap-server")
    (version "1.1.1.1")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://hackage.haskell.org/package/snap-server/snap-server-"
             version
             ".tar.gz"))
       (sha256
        (base32
         "0lw475wp0lnrbgc3jcfif3qjjc3pmrh2k74d8cgpnc1304g6a2s5"))))
    (build-system haskell-build-system)
    (inputs
     `(("ghc-attoparsec" ,ghc-attoparsec)
       ("ghc-blaze-builder" ,ghc-blaze-builder)
       ("ghc-bytestring-builder"
        ,ghc-bytestring-builder)
       ("ghc-case-insensitive" ,ghc-case-insensitive)
       ("ghc-clock" ,ghc-clock)
       ("ghc-io-streams" ,ghc-io-streams)
       ("ghc-io-streams-haproxy"
        ,ghc-io-streams-haproxy)
       ("ghc-lifted-base" ,ghc-lifted-base)
       ("ghc-network" ,ghc-network)
       ("ghc-old-locale" ,ghc-old-locale)
       ("ghc-snap-core" ,ghc-snap-core)
       ("ghc-unix-compat" ,ghc-unix-compat)
       ("ghc-vector" ,ghc-vector)))
    (arguments
     `(#:tests?
       #f
       #:cabal-revision
       ("1"
        "094b7ll47lxd4lvr6kd59jyw0vz686gw5cx16w758d6fli0cy3x3")))
    (home-page "http://snapframework.com/")
    (synopsis "A web server for the Snap Framework")
    (description
     "Snap is a simple and fast web development framework and server written in Haskell. For more information or to download the latest version, you can visit the Snap project website at <http://snapframework.com/>. . The Snap HTTP server is a high performance web server library written in Haskell. Together with the @snap-core@ library upon which it depends, it provides a clean and efficient Haskell programming interface to the HTTP protocol.")
    (license bsd-3)))
(define-public ghc-prettyclass
  (package
    (name "ghc-prettyclass")
    (version "1.0.0.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://hackage.haskell.org/package/prettyclass/prettyclass-"
             version
             ".tar.gz"))
       (sha256
        (base32
         "11l9ajci7nh1r547hx8hgxrhq8mh5gdq30pdf845wvilg9p48dz5"))))
    (build-system haskell-build-system)
    (arguments `(#:tests? #f))
    (home-page
     "http://hackage.haskell.org/package/prettyclass")
    (synopsis
     "Pretty printing class similar to Show.")
    (description
     "Pretty printing class similar to Show, based on the HughesPJ pretty printing library.  Provides the pretty printing class and instances for the Prelude types.")
    (license bsd-3)))

(define-public ghc-language-glsl
  (package
    (name "ghc-language-glsl")
    (version "0.3.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://hackage.haskell.org/package/language-glsl/language-glsl-"
             version
             ".tar.gz"))
       (sha256
        (base32
         "0hdg67ainlqpjjghg3qin6fg4p783m0zmjqh4rd5gyizwiplxkp1"))))
    (build-system haskell-build-system)
    (inputs `(("ghc-prettyclass" ,ghc-prettyclass)))
    (arguments
     `(#:tests?
       #f
       #:cabal-revision
       ("1"
        "10ac9pk4jy75k03j1ns4b5136l4kw8krr2d2nw2fdmpm5jzyghc5")))
    (home-page
     "http://hackage.haskell.org/package/language-glsl")
    (synopsis
     "GLSL abstract syntax tree, parser, and pretty-printer")
    (description
     "The package language-glsl is a Haskell library for the representation, the parsing, and the pretty-printing of GLSL 1.50 code.")
    (license bsd-3)))

