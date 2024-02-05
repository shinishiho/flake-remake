{ pkgs, ... }:

{
  hardware.cpu.intel.updateMicrocode = true;
  services.undervolt = {
    enable = true;
    coreOffset = null;
    gpuOffset = null;
    temp = null;
  };
}