{ stdenv, src, texdist, mainfile }:

stdenv.mkDerivation {
  name = "arxiv-bundle.tar.gz";

  inherit src;

  buildInputs = [ texdist ];

  # Create the bbl
  buildPhase = ''
    latexmk -pdf ${mainfile}
    rm *.aux *.bcf *.blg *.bib *.fdb_latexmk *.fls *.log *.out *.pdf *.run.xml *.toc
  '';

  installPhase = ''
    tar -czf $out *
  '';
}
