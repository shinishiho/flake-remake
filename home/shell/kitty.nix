{ pkgs, ... }:

{
  programs.kitty = {
    enable = true;
    font = {
      package = pkgs.(nerdfonts.override { fonts = [ "CaskaydiaCove" ]; });
      name = "CaskaydiaCove Nerd Font Mono";
      size = 10;
    };
    shellIntegration.enableZshIntegration = true;
  };
}