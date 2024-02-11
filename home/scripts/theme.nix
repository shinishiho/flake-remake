{ pkgs }:

pkgs.writeShellScriptBin "theme"
''
  ${pkgs.fortune-kind}/bin/fortune-kind | ${pkgs.cowsay}/bin/cowsay | ${pkgs.dotacat}/bin/dotacat
''