{
  inputs = {
    # The last commit with texlive-2020
    nixpkgs.url = "github:NixOS/nixpkgs/d280e1f78c244f71ee32c864ca24a85015f4ef74";

    flake-utils.url = "github:numtide/flake-utils";
  };
  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = nixpkgs.legacyPackages.${system};
      in rec {
        packages = rec {
          texdist = pkgs.texlive.combined.scheme-full;
          autotex = pkgs.callPackage ./nix/autotex.nix { inherit texdist; };
          arxiv-bundle = src:
            pkgs.callPackage ./nix/arxiv-bundle.nix { inherit texdist src; };
          arxiv-build = src:
            pkgs.callPackage ./nix/arxiv-build.nix {
              inherit autotex texdist; arxiv-bundle = (arxiv-bundle src);
            };
        };

      }
    ) // {
      templates.default = {
        path = ./template;
        description = "A basic setup for an arxiv-ready tex project";
      };
    };
}
