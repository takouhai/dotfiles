{
  config,
  pkgs,
  lib,
  ...
}: {
  services = {
    xserver = {
      desktopManager = {
        plasma5.enable = true;
      };
    };
  };
  environment.systemPackages = with pkgs; [
    aha
    fwupd
    glxinfo
    pciutils
    virtualgl
    vulkan-tools
    wayland-utils
    xorg.xdpyinfo
    kate

    libsForQt5.bismuth
    libsForQt5.kpmcore
  ];
}
