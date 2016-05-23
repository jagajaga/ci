/* Generate Haskell build instructions for the continuous integration system Hydra. */

{ gitSource
, serokellCoreSrc
, supportedPlatforms ? ["x86_64-linux"]
, supportedCompilers ? ["ghc7103"]
}:

let
  genAttrs = (import <nixpkgs> { }).lib.genAttrs;

  genBuild = system: compiler: path: 
    let pkgs = import <nixpkgs> { inherit system; };
        haskellPackages' = pkgs.lib.getAttrFromPath ["haskell" "packages" compiler] pkgs;
        haskellPackages  = haskellPackages'.override {
          overrides = self: super: {
            serokell-core = self.callPackage serokellCoreSrc { };
            msgpack = super.Chart.override {
              mkDerivation = (attrs: self.mkDerivation (attrs // { 
                src = ./msgpack-haskell/msgpack/.;
              }));
            };
            msgpack-aeson = super.Chart.override {
              mkDerivation = (attrs: self.mkDerivation (attrs // { 
                src = ./msgpack-haskell/msgpack-aeson/.;
              }));
            };
            msgpack-rpc = super.Chart.override {
              mkDerivation = (attrs: self.mkDerivation (attrs // { 
                src = ./msgpack-haskell/msgpack-rpc/.;
              }));
            };
          };
      };
    in
      haskellPackages.callPackage path { };
in
  genAttrs supportedCompilers (compiler:
    genAttrs supportedPlatforms (system:
      genBuild system compiler gitSource))
