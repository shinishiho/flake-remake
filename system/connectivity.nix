{ pkgs, ... }:

{
  # Enable Bluetooth
  hardware.bluetooth.enable = true;
  hardware.bluetooth.powerOnBoot = false;
  services.blueman.enable = true;

  # Enable networking
  networking.hostName = "shinishiho"; # Define your hostname.
  # Pick only one of the below networking options.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.
  # networking.networkmanager.enable = true;  # Easiest to use and most distros use this by default.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable MAC Randomize
  systemd.services.macchanger = {
    enable = false;
    description = "Change MAC address";
    wantedBy = [ "multi-user.target" ];
    after = [ "network.target" ];
    serviceConfig = {
      Type = "oneshot";
      ExecStart = "${pkgs.macchanger}/bin/macchanger -r wlo1";
      ExecStop = "${pkgs.macchanger}/bin/macchanger -p wlo1";
      RemainAfterExit = true;
    };
  };

  # Enable Mullvad VPN
  # services.mullvad-vpn = {
  #   enable = true;
  #   package = pkgs.mullvad-vpn; # Use pkgs.mullvad for CLI only
  # };

  # Enable Encrypted DNS
  networking = {
    nameservers = [ "127.0.0.1" "::1" ];
    # If using dhcpcd:
    # dhcpcd.extraConfig = "nohook resolv.conf";
    # If using NetworkManager:
    networkmanager = {
      enable = true;
      dns = "none";
    };
  };

  services.dnscrypt-proxy2 = {
    enable = true;
    settings = {
      ipv6_servers = true;
      require_dnssec = true;

      sources.public-resolvers = {
        urls = [
          "https://raw.githubusercontent.com/DNSCrypt/dnscrypt-resolvers/master/v3/public-resolvers.md"
          "https://download.dnscrypt.info/resolvers-list/v3/public-resolvers.md"
        ];
        cache_file = "/var/lib/dnscrypt-proxy2/public-resolvers.md";
        minisign_key = "RWQf6LRCGA9i53mlYecO4IzT51TGPpvWucNSCh1CBM0QTaLn73Y7GFO3";
      };

      # You can choose a specific set of servers from https://github.com/DNSCrypt/dnscrypt-resolvers/blob/master/v3/public-resolvers.md
      server_names = [ "cloudflare" "cloudflare-ipv6" "cloudflare-security" "cloudflare-security-ipv6" "adguard-dns-doh" "mullvad-adblock-doh" "mullvad-doh" "nextdns" "nextdns-ipv6" "quad9-dnscrypt-ipv4-filter-pri" "google" "google-ipv6" "ibksturm" ];
    };
  };

  systemd.services.dnscrypt-proxy2.serviceConfig = {
    StateDirectory = "dnscrypt-proxy";
  };

  environment.systemPackages = with pkgs; [
    mullvad-closest
    macchanger
  ];
}
