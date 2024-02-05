{ pkgs, ... }:

{
  hardware.cpu.intel.updateMicrocode = true;
  services.undervolt = {
    enable = false;
    coreOffset = null;
    gpuOffset = null;
    temp = null;
  };
}