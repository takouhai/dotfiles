{
  config,
  pkgs,
  lib,
  ...
}: {
  programs.hyprland.enable = true;
  environment.systemPackages = with pkgs; [
    dolphin
    mako
    eww-wayland
    glib
    layan-gtk-theme
    papirus-icon-theme
    swaybg
    rofi-wayland
    libsForQt5.polkit-kde-agent
  ];
  #imports = [
  #  ./nwg-look.nix
  #];
}
