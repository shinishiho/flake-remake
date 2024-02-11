{ pkgs, ... }:

{
  home.packages = [
    (imports ./test.nix { inherit pkgs; })
  ];
}