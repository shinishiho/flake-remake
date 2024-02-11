{ pkgs, config }:

pkgs.writeShellScriptBin {
  name = "theme";
  runtimeInputs = with pkgs; [ home-manager coreutils ripgrep ];
  text =
  ''
  ColorSel=$( ls ${config.xdg.configHome}/rofi/assets/*.svg | awk -F'/' '{print $NF}' | cut -d'.' -f 1 | ls | grep -v '[0-9]' | while read color
  do
    echo -en "$color\x00icon\x1f${config.xdg.configHome}/rofi/assets/$\{color}.svg\n"
  done | ${pkgs.rofi-wayland}/bin/rofi -dmenu )

  ThemeSel=$( ls ${config.xdg.configHome}/rofi/assets/*.svg | awk -F'/' '{print $NF}' | cut -d'.' -f 1 | grep '[0-9]' | while read theme
  do
    echo -en "$theme\x00icon\x1f${config.xdg.configHome}/rofi/assets/$\{theme}.svg\n"
  done | ${pkgs.rofi-wayland}/bin/rofi -dmenu -theme-str "listview{columns:2;lines:1;})

   
'';
}
#"$(home-manager generations | head -1 | rg -o '/[^ ]*')"/specialisation/$\{ThemeSel}-$\{ColorSel}/activate