{ config, pkgs, ... }:

{
  home.username = "nakxkri";
  home.homeDirectory = "/home/nakxkri";

  imports = [
    ./hypr
    ./shell
    ./scripts
  ];

  home.stateVersion = "23.11";
  programs.home-manager.enable = true;
}