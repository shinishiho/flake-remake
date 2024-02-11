{ config, inputs, pkgs, ... }:

{
  home.username = "nakxkri";
  home.homeDirectory = "/home/nakxkri";

  imports = [
    ./hypr
    ./rofi
    ./shell
    ./scripts
    inputs.nix-colors.homeManagerModules.default
  ];

  colorScheme = inputs.nix-colors.colorschemes.gruvbox-dark-hard;

  home.stateVersion = "24.05";
  programs.home-manager.enable = true;
}