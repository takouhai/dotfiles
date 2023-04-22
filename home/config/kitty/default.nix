{pkgs, ...}: {
  programs.kitty = {
    enable = true;
    font = {
      name = "VictorMono";
      size = 14;
      package = pkgs.nerdfonts.override {fonts = ["VictorMono"];};
    };
    theme = "Dracula";
    extraConfig = "background_opacity 0.9";
  };
}
