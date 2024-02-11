{ pkgs, ... }:

{
  home.packages = [
    (import ./test.nix { inherit pkgs; })
  ];
}