{ pkgs, ... }:

{
  programs.kitty = {
    enable = true;
    font = {
      package = (pkgs.nerdfonts.override { fonts = [ "CascadiaCode" ]; });
      name = "Cascadia Code Nerd Font Mono";
      size = 10;
    };
    shellIntegration.enableZshIntegration = true;
  };
}