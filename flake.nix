{
  description = "DBI Referat – Data Modeling mit Quarto";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = import nixpkgs { inherit system; };
        myPythonPackages = ps: with ps; [
          jupyter
          ipykernel
          matplotlib
          pandas
          numpy
        ];
        pythonEnv = pkgs.python3.withPackages myPythonPackages;
        # Workaround für https://github.com/NixOS/nixpkgs/issues/519484
        quarto = (pkgs.quarto.override {
          extraPythonPackages = myPythonPackages;
        }).overrideAttrs (oldAttrs: {
          postPatch = (oldAttrs.postPatch or "") + ''
            substituteInPlace bin/quarto.js \
              --replace-fail "syntax-highlighting" "highlight-style"
          '';
        });
      in
      {
        devShells.default = pkgs.mkShell {
          name = "dbi-referat";
          buildInputs = [
            quarto
            pythonEnv
            (pkgs.texliveSmall.withPackages (ps: with ps; [
              lualatex-math
              unicode-math
              fontspec
              microtype
              framed
              selnolig
              babel-german
              hyphen-german
            ]))
          ];
          shellHook = ''
            echo "DBI Referat Umgebung bereit"
            quarto --version
            python --version
          '';
        };
      });
}
