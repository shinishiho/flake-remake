{ pkgs, config, ... }:

{
  home.packages = [
    (import ./test.nix { inherit pkgs; })
    (import ./wpchange.nix { inherit pkgs; inherit config; })
  ];
}