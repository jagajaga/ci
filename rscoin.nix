{ serokellCoreSrc ? { outPath = ../serokellCore; revCount = 0; gitTag = "dirty"; }
, rscoinSrc ? { outPath = ../rscoin; revCount = 0; gitTag = "dirty"; }
}:
let
  pkgs = import <nixpkgs> { };
in
{
  rscoin = import ./generate-haskell-build.nix {
    inherit serokellCoreSrc;
    gitSource = rscoinSrc;
    expressionPath = rscoinSrc/default.nix;
  };

}
