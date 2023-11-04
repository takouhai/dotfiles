{
  config,
  pkgs,
  lib,
  ...
}: {
  programs.zsh.enable = true;
  users.defaultUserShell = pkgs.zsh;
  environment.shells = with pkgs; [zsh];
}
