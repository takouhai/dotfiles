{pkgs, ...}: {
  programs.git = {
    enable = true;
    userName = "Daniel Alejandro Gallegos";
    userEmail =
      if pkgs.stdenv.isDarwin
      then "daniel.gallegos@sapphire-digital.com"
      else "daniel@tacowolf.net";
  };
}
