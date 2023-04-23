{
  config,
  pkgs,
  lib,
  ...
}: {
  imports = [
    ../../modules/audio
    ../../modules/desktop/displaymanager
    ../../modules/desktop/plasma
    ../../modules/desktop/hyprland
    ../../modules/development
    ../../modules/games
    ../../modules/office
    ../../modules/shell
    ../../modules/system
    ../../modules/system/audio
    ../../modules/system/boot
    ../../modules/system/drivers/nvidia
    ../../modules/system/locale
    ../../modules/system/network
    ../../modules/system/printing
    ../../modules/system/fonts
    ../../modules/users
    ../../modules/utility
    ../../modules/video/editors
    ../../modules/video/players
    ./hardware-configuration.nix
  ];

  # modules
  boot.kernelModules = ["v4l2loopback"];

  # filesystem [luks]
  boot.initrd.luks.devices."luks-42dc4ae0-bba3-472c-b392-08e23925f576".device = "/dev/disk/by-uuid/42dc4ae0-bba3-472c-b392-08e23925f576";
  boot.initrd.luks.devices."luks-42dc4ae0-bba3-472c-b392-08e23925f576".keyFile = "/crypto_keyfile.bin";

  # networking
  networking.hostName = "myna";

  hardware.nvidia.prime = {
    sync.enable = true;
    nvidiaBusId = "PCI:1:0:0";
    intelBusId = "PCI:0:2:0";
  };

  services.pcscd.enable = true;
  programs.gnupg.agent = {
    enable = true;
    pinentryFlavor = "curses";
    enableSSHSupport = true;
  };

  # version [nixos]
  system.stateVersion = "22.11";

  nix.extraOptions = ''
    keep-outputs = true
    keep-derivations = true
  '';
}
