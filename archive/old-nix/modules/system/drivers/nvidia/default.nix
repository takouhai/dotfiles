{
  config,
  pkgs,
  lib,
  ...
}: {
  services.xserver.enable = true;
  services.xserver.videoDrivers = ["nvidia"];
  hardware.opengl.enable = true;
  hardware.nvidia = {
    package = config.boot.kernelPackages.nvidiaPackages.stable;
    modesetting.enable = true;
  };
}
