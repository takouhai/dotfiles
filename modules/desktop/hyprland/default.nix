{
  config,
  pkgs,
  lib,
  ...
}: {
  programs.hyprland.enable = true;
  environment.systemPackages = with pkgs; [
    dolphin
    dunst
    eww-wayland
    glib
    layan-gtk-theme
    papirus-icon-theme
    swaybg
    wofi
  ]; 
}
