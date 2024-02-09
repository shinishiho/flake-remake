{ pkgs, ... }:

{
  programs.kitty = {
    enable = true;
    font.size = 12;
    shellIntegration.enableZshIntegration = true;
  }
}