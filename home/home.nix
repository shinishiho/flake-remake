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
  specialisation.light-cyan = {
    colorScheme = inputs.nix-colors.colorschemes.gruvbox-light-hard;
  }; # Specialisation for default
  specialisation.dark-cyan = {
    colorScheme = inputs.nix-colors.colorschemes.gruvbox-dark-hard;
  };
  specialisation.light-green = {
    colorScheme = inputs.nix-colors.colorschemes.gruvbox-light-soft;
  };
  specialisation.dark-green = {
    colorScheme = inputs.nix-colors.colorschemes.gruvbox-dark-soft;
  };
  specialisation.light-magenta = {
    colorScheme = inputs.nix-colors.colorschemes.gruvbox-light-medium;
  };
  specialisation.dark-magenta = {
    colorScheme = inputs.nix-colors.colorschemes.gruvbox-dark-medium;
  };
  specialisation.light-orange = {
    colorScheme = inputs.nix-colors.colorschemes.gruvbox-light-hard;
  };
  specialisation.dark-orange = {
    colorScheme = inputs.nix-colors.colorschemes.gruvbox-dark-hard;
  };
  specialisation.light-purple = {
    colorScheme = inputs.nix-colors.colorschemes.gruvbox-light-soft;
  };
  specialisation.dark-purple = {
    colorScheme = inputs.nix-colors.colorschemes.gruvbox-dark-soft;
  };
  specialisation.light-yellow = {
    colorScheme = inputs.nix-colors.colorschemes.gruvbox-light-medium;
  };
  specialisation.dark-yellow = {
    colorScheme = inputs.nix-colors.colorschemes.gruvbox-dark-medium;
  };

  home.stateVersion = "24.05";
  programs.home-manager.enable = true;
}