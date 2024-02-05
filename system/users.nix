{ pkgs, inputs, ... }:

{
  users.users.nakxkri = { # Change your username
    isNormalUser = true;
    description = "NakXKri";
    extraGroups = [ "networkmanager" "input" "wheel" "video" "audio" "tss" ];
    shell = pkgs.zsh;
    packages = with pkgs; [
      spotify
      youtube-music
      discord
      tdesktop
      vscode
      brave
    ];
  };

  home-manager = {
    extraSpecialArgs = { inherit inputs; };
    users = {
      "nakxkri" = import ../home/home.nix; # Change your username
    };
  };

  # Change runtime directory size
  services.logind.extraConfig = "RuntimeDirectorySize=8G";

  # Enable Display Manager and autologin
  services.greetd = {
    enable = true;
    settings = {
      default_session = {
        command = "${pkgs.greetd.greetd}/bin/agreety --cmd Hyprland";
      };
      initial_session = {
        command = "Hyprland";
	      user = "nakxkri";
      };
    };
  };

  environment.systemPackages = with pkgs; [
    greetd.greetd
  ];
}
