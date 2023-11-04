{
  config,
  pkgs,
  lib,
  ...
}: {
  services.xserver = {
    layout = "us";
    xkbVariant = "";
    displayManager = {
      sddm = {
        enable = true;
      };
    };
  };
}
