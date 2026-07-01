# use alejandra for modern style
# Format with: `alejandra flake.nix`
{
  description = "Default CLI profile";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = {
    self,
    nixpkgs,
    flake-utils,
  }:
    flake-utils.lib.eachDefaultSystem (
      system: let
        pkgs = import nixpkgs {inherit system;};
      in {
        packages.default = pkgs.buildEnv {
          name = "default-profile";
          paths = with pkgs; [
            zsh
            fzf
            file
            python3
            tmux
            ranger
            alejandra
            neovim
          ];
        };
      }
    );
}
