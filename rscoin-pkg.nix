{ mkDerivation, acid-state, aeson, async, base, base64-bytestring
, binary, bytestring, cereal, conduit-extra, containers, cryptohash
, data-default, directory, either, exceptions, file-embed, filepath
, hashable, hslogger, hspec, lens, monad-control, monad-loops
, MonadRandom, msgpack, msgpack-aeson, msgpack-rpc, mtl
, optparse-applicative, pqueue, QuickCheck, random, safe, safecopy
, secp256k1, serokell-core, stdenv, stm, text, text-format, time
, time-units, transformers, transformers-base, tuple
, unordered-containers, vector
, git, zlib, openssh, autoreconfHook
, fetchgit
}:
mkDerivation {
  pname = "rscoin";
  version = "0.1.0.0";
  src = fetchgit {
    url = "git://github.com/serokell/rscoin.git";
    sha256 = "07m85kjca6f4fammj342w75dsnvv7x3rwpa3zjfdz2wjzwn68dvj";
    rev = "fa79f86ea977668acb7fbd86f5ce7589075f07a4";
  };
  isLibrary = true;
  isExecutable = true;
  libraryHaskellDepends = [
    acid-state aeson base base64-bytestring binary bytestring cereal
    conduit-extra containers cryptohash data-default directory either
    exceptions file-embed filepath hashable hslogger lens monad-control
    monad-loops MonadRandom msgpack msgpack-aeson msgpack-rpc mtl
    pqueue QuickCheck random safe safecopy secp256k1 serokell-core stm
    text text-format time time-units transformers transformers-base
    tuple unordered-containers vector
    git zlib openssh autoreconfHook
  ];
  executableHaskellDepends = [
    acid-state aeson base base64-bytestring binary bytestring cereal
    conduit-extra containers cryptohash data-default directory
    exceptions filepath hashable hslogger hspec lens monad-control
    monad-loops MonadRandom msgpack msgpack-aeson msgpack-rpc mtl
    optparse-applicative pqueue QuickCheck random safe safecopy
    secp256k1 serokell-core stm text text-format time time-units
    transformers transformers-base tuple unordered-containers vector
    git zlib openssh autoreconfHook
  ];
  testHaskellDepends = [
    acid-state async base bytestring containers data-default exceptions
    hspec lens MonadRandom msgpack msgpack-rpc mtl QuickCheck random
    safe safecopy serokell-core stm text time-units transformers tuple
    vector git zlib openssh autoreconfHook
  ];
  license = stdenv.lib.licenses.gpl3;
}
