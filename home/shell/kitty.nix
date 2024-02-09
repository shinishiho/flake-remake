{ pkgs, ... }:

{
  programs.kitty = {
    enable = true;
    font.package = pkgs.monaspace;
    font.name = "Monaspace Krypton";
    font.size = 12;
    shellIntegration.enableZshIntegration = true;
  };
}