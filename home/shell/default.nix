{ pkgs, ... }:

{
  imports = [
    ./shell.nix
    ./kitty.nix
  ];

  home.packages = with pkgs; [
    kitty
    dotacat
    cowsay
    fortune-kind
    starship
  ];
}