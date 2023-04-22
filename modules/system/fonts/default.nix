{
  config,
  pkgs,
  lib,
  ...
}: {
  fonts.fonts = with pkgs; [
    noto-fonts
    noto-fonts-extra
    noto-fonts-emoji-blob-bin
    cabin
    (nerdfonts.override { fonts = [ "JetBrainsMono" ]; })
    (nerdfonts.override { fonts = [ "VictorMono" ]; })
  ];
}
