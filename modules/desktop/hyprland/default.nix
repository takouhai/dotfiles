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
    wofi
    layan-gtk-theme
    papirus-icon-theme
  ]; 
}
