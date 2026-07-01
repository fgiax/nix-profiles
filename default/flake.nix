# use alejandra for modern style
# Format with: `alejandra flake.nix`
{
  description = "Default profile (don't use home-manager)";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
  };

  outputs = {
    self,
    nixpkgs,
  }: let
    system = "aarch64-linux";
    pkgs = nixpkgs.legacyPackages.${system};
  in {
    packages.${system}.default = pkgs.buildEnv {
      name = "default";
      paths = with pkgs; [
        zsh
        fzf
        file
        python3
        tmux
        ranger
        alejandra # formatter for nix
        neovim
      ];
    };
  };
}
