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
      if exists("g:neovide")
        vim.g.neovide_transparency = 0.0
        vim.g.transparency = 0.8
        vim.g.neovide_background_color = "#0f1117" .. alpha()
      endif
    '';
  };
}
