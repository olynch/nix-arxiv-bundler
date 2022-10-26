{
  inputs = {
    # The last commit with texlive-2020
    nix-arxiv-bundler.url = "github:olynch/nix-arxiv-bundler";

    nixpkgs.follows = "nix-arxiv-bundler/nixpkgs";

    flake-utils.url = "github:numtide/flake-utils";
  };
  outputs = { self, nix-arxiv-bundler, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = nixpkgs.legacyPackages.${system};
      in rec {
        packages = rec {
          arxiv-bundle = nix-arxiv-bundler.packages.${system}.arxiv-bundle ./src;
          arxiv-build = nix-arxiv-bundler.packages.${system}.arxiv-build ./src;
          default = arxiv-build;
        };

        devShell = with pkgs; mkShell {
          buildInputs = [
            nix-arxiv-bundler.packages.${system}.texdist
          ];
        };
      }
    );
}
