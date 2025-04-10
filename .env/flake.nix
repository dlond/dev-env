{
  description = "Python development environment using Nix flakes";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
  };

  outputs = { nixpkgs, ... }:
    let
      system = "aarch64-darwin";
      pkgs = import nixpkgs { inherit system; };

      python = pkgs.python313.withPackages (ps: with ps; [
        numpy
        pandas
        scipy
        matplotlib
        ipython
      ]);
    in {
      devShells.${system}.default = pkgs.mkShell {
        buildInputs = [
          python
        ];

        shellHook = ''
        export VIRTUAL_ENV=$PWD/.nix-python-env
        export PATH=$VIRTUAL_ENV/bin:$PATH
        echo "Activated Nix flake Python environment"

        exec zsh --rcs
        '';
      };
    };
}
