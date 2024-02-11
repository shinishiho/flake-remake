{ pkgs, config, ... }:

{
  programs.rofi = {
    enable = true;
    package = pkgs.rofi-wayland;
    font = "Iosevka Nerd Font 10";
    extraConfig = {
      modi = "drun";
      show-icons = true;
      display-drun = "";
      drun-display-format = "{name}";
    };
    theme = let inherit (config.lib.formats.rasi) mkLiteral;
      in {
        "*" = {
          # Help to decide color!!
          background = mkLiteral "#1E2127FF";
          background-alt = mkLiteral "#282B31FF";
          foreground = mkLiteral "#FFFFFFFF";
          selected = mkLiteral "#61AFEFFF";
          active = mkLiteral "#98C379FF";
          urgent = mkLiteral "#E06C75FF";
        };

        "#window" = {
          transparency = "real";
          # location = mkLiteral "center";
          anchor = mkLiteral "center";
          fullscreen = false;
          width = mkLiteral "500px";
          # x-offset = mkLiteral "0px";
          # y-offset = mkLiteral "0px";

          enabled = true;
          margin = mkLiteral "0px";
          padding = mkLiteral "0px";
          border = mkLiteral "0px solid";
          border-radius = mkLiteral "20px";
          border-color = mkLiteral "@selected";
          background-color = mkLiteral "@background";
          cursor = "default";
        };

        "#mainbox" = {
          enabled = true;
          spacing = mkLiteral "20px";
          margin = mkLiteral "0px";
          padding = mkLiteral "20px";
          border = mkLiteral "0px solid";
          border-radius = mkLiteral "0px 0px 0px 0px";
          border-color = mkLiteral "@selected";
          background-color = mkLiteral "transparent";
          children = map mkLiteral [ "listview" ];
        };

        "#listview" = {
          enabled = true;
          columns = 3;
          lines = 2;
          cycle = false;
          dynamic = true;
          scollbar = false;
          layout = "vertical";
          reverse = false;
          fixed-height = true;
          fixed-columns = true;

          spacing = mkLiteral "10px";
          margin = mkLiteral "0px";
          padding = mkLiteral "0px";
          border = mkLiteral "0px solid";
          border-radius = mkLiteral "0px";
          border-color = mkLiteral "@selected";
          background-color = mkLiteral "transparent";
          text-color = mkLiteral "@foreground";
          cursor = "default";
        };

        "#element" = {
          enabled = true;
          spacing = mkLiteral "15px";
          margin = mkLiteral "0px";
          padding = mkLiteral "20px 10px";
          border = mkLiteral "0px solid";
          border-radius = mkLiteral "20px";
          border-color = mkLiteral "@selected";
          background-color = mkLiteral "transparent";
          text-color = mkLiteral "@foreground";
          orientation = "vertical";
          cursor = "pointer";
        };
        "#element normal.normal" = {
          background-color = mkLiteral "transparent";
          text-color = mkLiteral "@foreground";
        };
        "#element selected.normal" = {
          background-color = mkLiteral "@background-alt";
          text-color = mkLiteral "@foreground";
        };
        "#element-icon" = {
          background-color = mkLiteral "transparent";
          text-color = mkLiteral "inherit";
          size = mkLiteral "128px";
          cursor = mkLiteral "inherit";
        };
        "#element-text" = {
          enabled = false;
        };

        "#error-message" = {
          padding = mkLiteral "20px";
          border = mkLiteral "0px solid";
          border-radius = mkLiteral "0px";
          border-color = mkLiteral "@selected";
          background-color = mkLiteral "black / 0.1";
          text-color = mkLiteral "@foreground";
        };
        "#textbox" = {
          background-color = mkLiteral "transparent";
          text-color = mkLiteral "@foreground";
          vertical-align = mkLiteral "0.5";
          horizontal-align = mkLiteral "0.0";
          highlight = mkLiteral "none";
        };
      };
  };
}