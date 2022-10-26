{ stdenv, texdist, buildPerlPackage, perlPackages, fetchurl, bash }:

let
  arXivFileGuess = buildPerlPackage rec {
    pname = "arXiv";
    version = "1.01";
    src = fetchurl {
      url = "mirror://cpan/authors/id/S/SI/SIMEON/${pname}-${version}.tar.gz";
      sha256 = "sha256-wsbcrHGdQ5rAdpVOzUpK4vlfZPqXy/KAEHMDxux8jGs=";
    };
    propagatedBuildInputs = [ perlPackages.TestMore ];
  };

in buildPerlPackage rec {
  pname = "TeX-AutoTeX";
  version = "v0.906.0";
  src = fetchurl {
    url = "mirror://cpan/authors/id/T/TS/TSCHWAND/${pname}-${version}.tar.gz";
    sha256 = "sha256-cbqSpbOqJyXcnXTbT/2mI/vWfWIZz/sQRGsKocAj5sc=";
  };
  patchPhase = ''
    runHook prePatch
    ls
    sed -e 's#NIX_TEX_PATH#${texdist}#g' -e 's#NIX_BASH_PATH#${bash}#g' \
      ${./Config.pm} > lib/TeX/AutoTeX/Config.pm
  '';
  propagatedBuildInputs = [
    texdist
    perlPackages.cam_pdf
    perlPackages.ClassAccessorFast
    perlPackages.Error
    perlPackages.TestMore
    arXivFileGuess
  ];
}
