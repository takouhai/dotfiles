{
  config,
  pkgs,
  ...
}: let
  username =
    if pkgs.stdenv.isDarwin
    then "dgallegos"
    else "taco";
  homeDirectory =
    if pkgs.stdenv.isDarwin
    then "/Users/${username}"
    else "/home/${username}";
  configHome = "${homeDirectory}/.dotfiles";
in {
  programs.home-manager.enable = true;
  home = {
    inherit username homeDirectory;
    stateVersion = "22.11";
  };

  imports = [
    ./packages
  ];
}
