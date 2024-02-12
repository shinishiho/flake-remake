{ pkgs, config }:

pkgs.writeShellApplication {
  name = "theme";
  runtimeInputs = with pkgs; [ home-manager coreutils ripgrep ];
  text =
  ''
  colors=("cyan" "green" "magenta" "orange" "purple" "yellow")
  themes=("dark" "light")

  ColorSel=$( for color in $\{colors[@]}; do
    echo -en "$color\x00icon\x1f${config.xdg.configHome}/rofi/assets/$\{color}.svg\n"
  done | ${pkgs.rofi-wayland}/bin/rofi -dmenu )

  ThemeSel=$( for theme in $\{themes[@]}; do
    echo -en "$theme\x00icon\x1f${config.xdg.configHome}/rofi/assets/$\{theme}.svg\n"
  done | ${pkgs.rofi-wayland}/bin/rofi -dmenu -theme-str "listview{columns:2;lines:1;}")

   
'';
}
#"$(home-manager generations | head -1 | rg -o '/[^ ]*')"/specialisation/$\{ThemeSel}-$\{ColorSel}/activate