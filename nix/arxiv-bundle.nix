{ stdenv, src, texdist }:

stdenv.mkDerivation {
  name = "arxiv-bundle.tar.gz";

  inherit src;

  buildInputs = [ texdist ];

  # Create the bbl
  buildPhase = ''
    latexmk -pdf
    rm *.aux *.bcf *.blg *.fdb_latexmk *.fls *.log *.out *.pdf *.run.xml *.toc
  '';

  installPhase = ''
    tar -czf $out *
  '';
}
