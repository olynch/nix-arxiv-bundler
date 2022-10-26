{ stdenv, arxiv-bundle, autotex, texdist, perl, writeText }:

let
  autoTeXScript = writeText "run-autotex.pl" ''
    use TeX::AutoTeX;
    my $t = TeX::AutoTeX->new(
      workdir => $ARGV[0],
      verbose => 1,
    );
    $t->{log} = TeX::AutoTeX::Log->new(
        dir => $t->{workdir},
        verbose => $t->{verbose},
        dupefh => $t->{verbose} ? \*STDOUT : undef,
        );
    $t->{log}->open_logfile();
    $t->set_dvips_resolution(600);
    $t->{branch} = '3';
    $t->{tex_env_path} = '${texdist}/bin';
    $t->set_stampref(['nix-arxiv-bundler created file', 'https://github.com/olynch/nix-arxiv-bundler'])
    if ($t->process()) {
      exit 0;
    } else {
      system("cat", "$t->{workdir}/auto_gen_ps.log");
      exit 1;
    }
  '';
in stdenv.mkDerivation {
  name = "arxiv-build";

  src = arxiv-bundle;

  buildInputs = [ autotex perl ];

  unpackPhase = ''
    tar -xf $src
  '';

  buildPhase = ''
    chmod 775 .
    perl ${autoTeXScript} $PWD
  '';

  installPhase = ''
    mkdir $out
    cp -R * $out
  '';
}
