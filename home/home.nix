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

  colorScheme = inputs.nix-colors.colorschemes.gruvbox-dark-hard; # Default color scheme
  specialisation = {
    light-cyan.configuration = {
      colorScheme = inputs.nix-colors.colorschemes.gruvbox-light-hard;
    };
    dark-cyan.configuration = {
      colorScheme = inputs.nix-colors.colorschemes.gruvbox-dark-hard;
    };
    light-green.configuration = {
      colorScheme = inputs.nix-colors.colorschemes.gruvbox-light-soft;
    };
    dark-green.configuration = {
      colorScheme = inputs.nix-colors.colorschemes.gruvbox-dark-soft;
    };
    light-magenta.configuration = {
      colorScheme = inputs.nix-colors.colorschemes.gruvbox-light-medium;
    };
    dark-magenta.configuration = {
      colorScheme = inputs.nix-colors.colorschemes.gruvbox-dark-medium;
    };
    light-orange.configuration = {
      colorScheme = inputs.nix-colors.colorschemes.gruvbox-light-hard;
    };
    dark-orange.configuration = {
      colorScheme = inputs.nix-colors.colorschemes.gruvbox-dark-hard;
    };
    light-purple.configuration = {
      colorScheme = inputs.nix-colors.colorschemes.gruvbox-light-soft;
    };
    dark-purple.configuration = {
      colorScheme = inputs.nix-colors.colorschemes.gruvbox-dark-soft;
    };
    light-yellow.configuration = {
      colorScheme = inputs.nix-colors.colorschemes.gruvbox-light-medium;
    };
    dark-yellow.configuration = {
      colorScheme = inputs.nix-colors.colorschemes.gruvbox-dark-medium;
    };
  };

  home.stateVersion = "24.05";
  programs.home-manager.enable = true;
}