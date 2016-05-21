/* Generate Haskell build instructions for the continuous integration system Hydra. */

{ gitSource
, serokellCoreSrc
, supportedPlatforms ? ["x86_64-linux"]
, supportedCompilers ? ["ghc7103"]
}:

let
  genAttrs = (import <nixpkgs> { }).lib.genAttrs;

  genBuild = system: compiler: path: gitSource:
    let pkgs = import <nixpkgs> { inherit system; };
        haskellPackages' = pkgs.lib.getAttrFromPath ["haskell" "packages" compiler] pkgs;
        haskellPackages  = haskellPackages'.override {
          overrides = self: super: {
            serokell-core = self.callPackage serokellCoreSrc {};
          };
      };
    in
      haskellPackages.callPackage path {
        mkDerivation = expr: haskellPackages.mkDerivation (expr // {
         src = gitSource;
         version = gitSource.gitTag;
        });
      };
in
  genAttrs supportedCompilers (compiler:
    genAttrs supportedPlatforms (system:
      genBuild system compiler (gitSource/default.nix) gitSource))
