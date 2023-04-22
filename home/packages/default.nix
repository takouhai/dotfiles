{
  pkgs,
  lib,
  ...
}: let
  unixTools = with pkgs; [
    bat
    btop
    curlie
    dog
    du-dust
    fzf
    glances
    gping
    httpie
    jq
    lsd
    neofetch
    pls
    starship
    thefuck
    tldr
    xplr
    zoxide
  ];
  gitFlow = with pkgs; [
    git
    gnupg
    pinentry-curses
  ];
  nixTools = with pkgs; [
    alejandra
  ];
  easterEggs = with pkgs; [
    asciiquarium
  ];
in {
  home.packages = with pkgs;
    []
    ++ unixTools
    ++ gitFlow
    ++ nixTools ++ easterEggs;
  imports = import ../config;
}
