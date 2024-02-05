{ pkgs, ... }:

{
  # Enable Containerd
  # virtualisation.containerd.enable = true;

  # Enable Docker
  # virtualisation.docker.enable = true;
  # virtualisation.docker.rootless = {
  #   enable = true;
  #   setSocketVariable = true;
  # };
  # users.extraGroups.docker.members = [ "xnm" ];

  virtualisation = {
    podman = {
      enable = true;

      # Create a `docker` alias for podman, to use it as a drop-in replacement
      dockerCompat = true;

      # Required for containers under podman-compose to be able to talk to each other.
      defaultNetwork.settings.dns_enabled = true;
    };

    waydroid.enable = true;
  };

  environment.systemPackages = with pkgs; [
    # nerdctls

    # firecracker
    # firectl
    # flintlock

    distrobox
    qemu

    waydroid

    podman-compose
    podman-tui

    # lazydocker
    # docker-credential-helpers
  ];
}
