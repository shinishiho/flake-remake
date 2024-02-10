{ pkgs, ... }:

{
  programs = {
    zsh = {
      enable = true;
      enableAutosuggestions = true;
      autocd = true;
    };

    tmux = {
      enable = true;
      shell = "\${pkgs.zsh}/bin/zsh";
    };
  };
}