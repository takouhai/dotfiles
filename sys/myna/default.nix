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
    ../../modules/system/drivers/nvidia
    ../../modules/system/locale
    ../../modules/system/network
    ../../modules/system/printing
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
      steam
      speedcrunch
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
  system.stateVersion = "unstable";

  nix.extraOptions = ''
    keep-outputs = true
    keep-derivations = true
  '';
}
