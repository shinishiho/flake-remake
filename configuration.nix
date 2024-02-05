{ pkgs, ... }:

{
  imports = [
    /etc/nixos/hardware-configuration.nix
    inputs.home-manager.nixosModule.default
    ./system ./hardware
  ];

  # Nix Configuration
  nix.settings = {
    experimental-features = [ "nix-command" "flakes" ];    
    auto-optimise-store = true;
    tarball-ttl = 60 * 10;
  };
  nix.optimise.automatic = true;
  nixpkgs.config.allowUnfree = true;
  nix.gc = {
    automatic = true;
    dates = "daily";
    options = "--delete-older-than 3d";
  };
  nixpkgs.config.packageOverrides = pkgs: {
    nur = import (builtins.fetchTarball "https://github.com/nix-community/NUR/archive/master.tar.gz") {
      inherit pkgs;
    };
  };

  system.stateVersion = "23.11";
}