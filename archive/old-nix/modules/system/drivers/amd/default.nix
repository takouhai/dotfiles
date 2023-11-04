{
  config,
  pkgs,
  lib,
  ...
}: {
  services.xserver.enable = true;
  services.xserver.videoDrivers = ["amdgpu"];
  boot.initrd.kernelModules = ["amdgpu"];
  hardware.opengl.driSupport = true;
  hardware.opengl.driSupport32Bit = true;
}
