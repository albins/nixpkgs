# This file was auto-generated by cabal2nix. Please do NOT edit manually!

{ cabal, Cabal, lens, unorderedContainers }:

cabal.mkDerivation (self: {
  pname = "cabal-lenses";
  version = "0.3";
  sha256 = "13nx9cn81cx9cj7fk07akqvz4qkl49dlgb5wl5wanag6bafa6vhl";
  buildDepends = [ Cabal lens unorderedContainers ];
  meta = {
    description = "Lenses and traversals for the Cabal library";
    license = self.stdenv.lib.licenses.bsd3;
    platforms = self.ghc.meta.platforms;
  };
})