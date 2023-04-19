{pkgs, ...}: {
  programs.neovim = {
    enable = true;
    plugins = with pkgs.vimPlugins; let
    in [
      vim-nix
      vim-prettier
    ];
    extraConfig = ''
      packloadall
      set tabstop=2
      set shiftwidth=2
      set expandtab
    '';
  };
}
