{
  config,
  pkgs,
  lib,
  ...
}: {
  programs.hyprland.enable = true;
  environment.systemPackages = with pkgs; [
    dunst
    dolphin
    wofi
    waybar
  ]; 
}
