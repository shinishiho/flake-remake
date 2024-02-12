{ pkgs, config, ... }:

{
  home.packages = [
    (import ./test.nix { inherit pkgs; })
    (import ./theme.nix { inherit pkgs; inherit config; })
  ];
}