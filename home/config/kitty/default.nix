{pkgs, ...}: {
  programs.kitty = {
    enable = true;
    font = {
      name = "JetBrainsMono";
      size = 14;
      package = pkgs.nerdfonts.override {fonts = ["JetBrainsMono"];};
    };
    theme = "Dracula";
    extraConfig = "background_opacity 0.9";
  };
}
