{
  config,
  pkgs,
  lib,
  ...
}: {
  imports = [
    # hardware configuration [install]
    ./hardware-configuration.nix
  ];

  # bootloader [systemd-boot]
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.efi.efiSysMountPoint = "/boot/efi";

  # filesystem [luks]
  boot.initrd.secrets = {
    "/crypto_keyfile.bin" = null;
  };
  boot.initrd.luks.devices."luks-8d53a19b-7ed1-49db-a081-18bb15dfea9f".device = "/dev/disk/by-uuid/8d53a19b-7ed1-49db-a081-18bb15dfea9f";
  boot.initrd.luks.devices."luks-8d53a19b-7ed1-49db-a081-18bb15dfea9f".keyFile = "/crypto_keyfile.bin";

  # networking
  networking.hostName = "fishcrow";
  networking.networkmanager.enable = true;

  # locale
  time.timeZone = "America/New_York";
  i18n.defaultLocale = "en_US.UTF-8";
  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_US.UTF-8";
    LC_IDENTIFICATION = "en_US.UTF-8";
    LC_MEASUREMENT = "en_US.UTF-8";
    LC_MONETARY = "en_US.UTF-8";
    LC_NAME = "en_US.UTF-8";
    LC_NUMERIC = "en_US.UTF-8";
    LC_PAPER = "en_US.UTF-8";
    LC_TELEPHONE = "en_US.UTF-8";
    LC_TIME = "en_US.UTF-8";
  };

  # display [x11]
  services.xserver.enable = true;

  # display [kde]
  services.xserver.displayManager.sddm.enable = true;
  services.xserver.desktopManager.plasma5.enable = true;

  # keymap [x11]
  services.xserver = {
    layout = "us";
    xkbVariant = "";
  };

  # printing [cups]
  services.printing.enable = true;
  services.printing.drivers = [pkgs.cnijfilter2];

  # sound [pipewire]
  sound.enable = true;
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
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
    ];
  };

  nixpkgs.config.allowUnfree = true;

  nix.settings.experimental-features = ["nix-command" "flakes"];

  # packages [system]
  environment.systemPackages = with pkgs; [
    # kde system utils
    aha
    fwupd
    glxinfo
    pciutils
    qt6.full
    virtualgl
    vulkan-tools
    wayland-utils
    xorg.xdpyinfo
    kate

    # tiling for kde
    libsForQt5.bismuth
  ];

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
