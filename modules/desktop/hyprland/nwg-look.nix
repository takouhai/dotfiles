{pkgs, ...}: let
  nwg-look = with pkgs;
    buildGoModule rec {
      pname = "nwg-look-${version}";
      version = "0.1.4";

      src = fetchFromGitHub {
        owner = "nwg-piotr";
        repo = "nwg-look";
        rev = "9bb91da211c5d494e755cf9715938d68a0d00c6a";
        sha256 = "0x19893377j02dl6mfw1ydpnbmw7wzfw7hfh1yjhjrwv61svkgw9";
      };

      nativeBuildInputs = [gtk3 xcur2png glib cairo];
    };
in {
  users.users.taco.packages = with pkgs; [nwg-look];
}
# stolen from https://github.com/addy419/configurations/blob/master/external-modules/nwg-look.nix

