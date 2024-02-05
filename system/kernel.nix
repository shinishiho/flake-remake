{ pkgs,  ... }:

{
  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.efi.efiSysMountPoint = "/boot";
  boot.loader.timeout = 2;
  boot.initrd.enable = true;
  boot.initrd.systemd.enable = true;
  boot.plymouth = {
    enable = true;
    font = "${pkgs.jetbrains-mono}/share/fonts/truetype/JetBrainsMono-Regular.ttf";
    themePackages = [ pkgs.catppuccin-plymouth ];
    theme = "catppuccin-macchiato";
  };

  # Linux Kernel
  boot.kernelPackages = pkgs.linuxKernel.packages.linux_zen;
  boot.kernelParams = [ 
    "quiet"
    "splash"
	  "loglevel=3"
	  "rd.udev.log_level=3"
	  "rd.udev.log_priority=3"
    "fbcon=nodefer"
    "vt.global_cursor_default=0"
    "kernel.modules_disabled=1"
    "lsm=landlock,lockdown,yama,integrity,apparmor,bpf,tomoyo,selinux"
    "usbcore.autosuspend=-1"
    "video4linux"
    "acpi_rev_override=5"
    "security=selinux"
  ];

  systemd.package = pkgs.systemd.override { withSelinux = true; };
  environment.systemPackages = with pkgs; [
    policycoreutils
  ];
}