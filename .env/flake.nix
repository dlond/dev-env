{
  description = "LaTeX development environment using Nix flakes";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
  };

  outputs = { nixpkgs, ... }:
    let
      system = "aarch64-darwin";
      pkgs = import nixpkgs { inherit system; };

      tex = pkgs.texlive.combine {
        inherit (pkgs.texlive)
        scheme-small    # base LaTeX, enough for custom setup
        latexmk         # smart PDF compiler
        xetex           # better font and UTF-8 support
        fontspec        # for custom fonts
        babel           # multilingual support
        geometry        # control page layout
        fancyhdr        # headers and footers
        titlesec        # section formatting
        enumitem        # better itemize/enumerate
        hyperref        # clickable links
        graphicx        # includegraphics
        xcolor;         # color support
      };
    in {
      devShells.${system}.default = pkgs.mkShell {
        packages = [ pkgs.texliveFull ];
        shellHook = ''
          echo "Activated LaTeX flake environment. Run: latexmk -xelatex [tex file]"

          exec zsh --rcs
          '';
      };
    };
}
