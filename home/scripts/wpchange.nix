{ pkgs, config }:

pkgs.writeShellApplication {
  name = "wpchange";
  runtimeInputs = with pkgs; [ home-manager coreutils ripgrep imagemagick ];
  text =
  ''
  input_wall="$1"
  dcol=( "$(magick "${input_wall}"[0] -colors 3 -define histogram:unique-colors=true -format "%c" histogram:info: | awk '{print substr($3,2,6)}' | awk '{printf "%d %s\n", "0x"$1, $0}' | sort -n | awk '{print $2}')" )
  for (( i = 1; i < 3; i++ )) ; do
      [ -z "${dcol[i]}" ] && dcol[i]=${dcol[i-1]}
  done
  for (( j = 0; j < 3; j++ )) ; do
    r_swatch=$(echo "#${dcol[j]}" | sed 's/#//g')
    echo "dcol_pry${j}=\"${r_swatch}\"" >> "${config.xdg.cacheHome}/colors.dcol"
    r_swatch=$(hex_conv "$(convert xc:"#$\{dcol[j]\}" -negate -format "%c" histogram:info: | awk '{print $4}')")
    echo "dcol_txt${j}=\"${r_swatch}\"" >> "${config.xdg.cacheHome}/colors.dcol"
    z=0

    if dark_light "#${dcol[j]}" ; then
      # Generate accent colors for lighter shades...
      for t in 30 50 70 90 ; do
          z=$(( z + 1 ))
          r_swatch=$(hex_conv "$(convert xc:"#${dcol[j]}" -modulate 200,"$(awk "BEGIN {print $t * 1.5}")",$(( 100 - (2*z) )) -channel RGB -evaluate multiply 1.$t -format "%c" histogram:info: | awk '{print $4}')")
          echo "dcol_${j}xa${z}=\"${r_swatch}\"" >> "${config.xdg.cacheHome}/colors.dcol"
      done
    else
      # Generate accent colors for darker shades...
      for t in 15 35 55 75 ; do
          z=$(( z + 1 ))
          r_swatch=$(hex_conv "$(convert xc:"#${dcol[j]}" -modulate 80,"$(awk "BEGIN {print $t * 1.5}")",$(( 100 + (2*z) )) -channel RGB -evaluate multiply 1.$t -format "%c" histogram:info: | awk '{print $4}')")
          echo "dcol_${j}xa${z}=\"${r_swatch}\"" >> "${config.xdg.cacheHome}/colors.dcol"
      done
    fi
  done
'';
}