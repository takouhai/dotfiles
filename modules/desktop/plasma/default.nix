{
  config,
  pkgs,
  lib,
  ...
}: {
  services = {
    xserver = {
      layout = "us";
      xkbVariant = "";
      displayManager = {
        lightdm.enable = true;
      };
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
