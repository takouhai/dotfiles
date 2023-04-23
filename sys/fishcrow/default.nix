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
    ../../modules/office
    ../../modules/shell
    ../../modules/system
    ../../modules/system/audio
    ../../modules/system/boot
    ../../modules/system/drivers/amd
    ../../modules/system/locale
    ../../modules/system/network
    ../../modules/system/printing
    ../../modules/users
    ../../modules/utility
    ../../modules/video/players
    ./hardware-configuration.nix
  ];

  # filesystem [luks]
  boot.initrd.luks.devices."luks-8d53a19b-7ed1-49db-a081-18bb15dfea9f".device = "/dev/disk/by-uuid/8d53a19b-7ed1-49db-a081-18bb15dfea9f";
  boot.initrd.luks.devices."luks-8d53a19b-7ed1-49db-a081-18bb15dfea9f".keyFile = "/crypto_keyfile.bin";

  # networking
  networking.hostName = "fishcrow";

  services.pcscd.enable = true;
  programs.gnupg.agent = {
    enable = true;
    pinentryFlavor = "curses";
    enableSSHSupport = true;
  };

  fonts.fonts = with pkgs; [
    (nerdfonts.override {fonts = ["JetBrainsMono"];})
  ];

  # version [nixos]
  system.stateVersion = "22.11";
}
