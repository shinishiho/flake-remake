{ pkgs, ... }:

{
  imports = [
    ./hypr.nix
  ];

  home.packages = with pkgs; [
    bibata-cursors
  ];
}