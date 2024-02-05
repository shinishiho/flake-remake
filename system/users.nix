{ pkgs, ... }:

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

  # Change runtime directory size
  services.logind.extraConfig = "RuntimeDirectorySize=8G";

  # Enable Display Manager
  services.greetd = {
    enable = true;
    settings = {
      default_session = {
        command = "${pkgs.greetd.greetd}/bin/agreety --cmd Hyprland";
        user = "nakxkri"; # Change your username
      };
    };
  };

  environment.systemPackages = with pkgs; [
    greetd.greetd
  ];
}
