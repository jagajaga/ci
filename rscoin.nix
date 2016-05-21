{ serokellCoreSrc ? { outPath = ../rscoin; revCount = 0; gitTag = "dirty"; }, rscoinSrc ? { outPath = ../rscoin; revCount = 0; gitTag = "dirty"; } }:
let
  pkgs = import <nixpkgs> { };
in
{
  serokell-core = pkgs.haskellPackages.callPackage serokellCoreSrc;

  rscoin = import ./generate-haskell-build.nix {
    gitSource = rscoinSrc;
    expressionPath = ./rscoin-pkg.nix;
  };

}
