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
      lightdm = {
        enable = true;
        greeters.gtk.enable = true;
      };
    };
  };
}
