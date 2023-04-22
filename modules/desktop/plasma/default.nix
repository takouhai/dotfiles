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
    partition-manager

    layan-kde
    papirus-icon-theme

    libsForQt5.bismuth
    libsForQt5.kpmcore
  ];
}
