{ pkgs, ... }:

{
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