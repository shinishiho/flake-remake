{ ... }:

{
  # Enable zram swap
  zramSwap.enable = true;

  # Auto upgrade system
  system.autoUpgrade = {
    enable = true;
    operation = "boot"; # If you don't want to apply updates immediately, only after rebooting, use `boot` option in this case
    flake = "/etc/nixos";
    flags = [ "--update-input" "nixpkgs" "--update-input" "--commit-lock-file" ];
    dates = "weekly";
  };

  # OpenGL
  hardware.opengl.enable = true;
}