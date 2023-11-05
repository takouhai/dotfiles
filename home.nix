{ config, pkgs, ... }:

{
  home.username = "taco";
  home.homeDirectory = "/home/taco";

  home.stateVersion = "23.05"; 

  home.packages = with pkgs; [
    alejandra
    asciiquarium
    bat
    broot
    btop
    delta
    dog
    du-dust
    duf
    eza
    fastfetch
    fzf
    glances
    gping
    hexyl
    httpie
    hyperfine
    jq
    lsd
    neofetch
    nnn
    onefetch
    oneko
    pls
    ripgrep
    shellcheck
    tldr
    tmatrix
    xplr
    xsv
    zoxide
  ];

  home.file = {
    # TODO: add non-nix manageable dotfiles
  };

  home.sessionVariables = {
    EDITOR = "nvim --clean";
  };

  programs.zsh = {
    enable = true;
    shellAliases = {
      please = "sudo";

      # change the dir so it's always available when we run the commands
      changeDir = "currentDir=$(pwd);cd ~/.dotfiles";
      revertDir = "cd $currentDir";

      # rebuild my home configuration, managed by home-manager
      rebuildHome = "home-manager switch --flake .#taco";

      # update zshrc because i use zsh
      sourceZshrc = "source $HOME/.zshrc";
      # i keep typing this instead so add a shortcut for it
      updateZshrc = "sourceZshrc";

      # update nix channels (imagine an apt update for nix)
      updateChannel = "nix-channel --update";
      # update your flake (updates the flake.lock)
      updateFlake = "nix flake update";

      # get the files we need, rebuild home, pop the stack, and update zsh
      updateHome = "changeDir && rebuildHome && updateZshrc && revertDir";

      updateAll = "changeDir && updateChannel && updateFlake && updateHome && revertDir";
    };
    oh-my-zsh = {
      enable = true;
      plugins = ["git" "thefuck" "volta" "rust" "rvm" "zoxide"];
      theme = "bureau";
    };
  };

  programs.home-manager.enable = true;
}
