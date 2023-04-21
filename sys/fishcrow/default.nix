{
  config,
  pkgs,
  lib,
  ...
}: {
  imports = [
    ./hardware-configuration.nix
    ../../modules/desktop/plasma
    ../../modules/system/audio
    ../../modules/system/boot
    ../../modules/system/drivers/amd
    ../../modules/system/network
    ../../modules/system/locale
    ../../modules/system/printing
  ];

  # filesystem [luks]
  boot.initrd.luks.devices."luks-8d53a19b-7ed1-49db-a081-18bb15dfea9f".device = "/dev/disk/by-uuid/8d53a19b-7ed1-49db-a081-18bb15dfea9f";
  boot.initrd.luks.devices."luks-8d53a19b-7ed1-49db-a081-18bb15dfea9f".keyFile = "/crypto_keyfile.bin";

  # networking
  networking.hostName = "fishcrow";

  programs.zsh.enable = true;

  # users
  users.users.taco = {
    isNormalUser = true;
    description = "taco";
    shell = pkgs.zsh;
    extraGroups = ["networkmanager" "wheel"];
    packages = with pkgs; [
      # web browsers
      firefox
      ungoogled-chromium
      brave
      librewolf
      tor-browser-bundle-bin
      # comms
      tdesktop
      discord
      # media
      spotify
      tidal-hifi
      jellyfin-media-player
      # office
      logseq
      figma-linux
      qflipper
    ];
  };

  nixpkgs.config.allowUnfree = true;

  nix.settings.experimental-features = ["nix-command" "flakes"];

  services.pcscd.enable = true;
  programs.gnupg.agent = {
    enable = true;
    pinentryFlavor = "curses";
    enableSSHSupport = true;
  };

  fonts.fonts = with pkgs; [
    (nerdfonts.override {fonts = ["JetBrainsMono"];})
  ];

  nixpkgs.config.packageOverrides = pkgs: {
    nur = import (builtins.fetchTarball "https://github.com/nix-community/NUR/archive/master.tar.gz") {
      inherit pkgs;
    };
  };

  # version [nixos]
  system.stateVersion = "22.11";
}
