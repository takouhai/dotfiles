{pkgs, ...}: {
  programs.neovim = {
    enable = true;
    viAlias = true;
    vimAlias = true;
    vimdiffAlias = true;

    coc.enable = true;

    plugins = with pkgs.vimPlugins; let
    in [
      vim-nix
      coc-nvim
      coc-prettier
      neo-tree-nvim
    ];
    extraConfig = ''
      set tabstop=2
      set shiftwidth=2
      set expandtab
      command! -nargs=0 Prettier :CocCommand prettier.forceFormatDocument
    '';
  };
}
