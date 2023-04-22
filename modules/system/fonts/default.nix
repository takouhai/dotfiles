{
  config,
  pkgs,
  lib,
  ...
}: {
  fonts.fonts = with pkgs; [
    noto-fonts
    noto-fonts-emoji
    cabin
    (nerdfonts.override {fonts = ["JetBrainsMono" "VictorMono"];})
  ];
}
