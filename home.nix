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
    byobu
    curlie
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
    lazygit
    lsd
    neofetch
    nnn
    onefetch
    oneko
    pinentry-curses
    pls
    ripgrep
    rustup
    shellcheck
    sl
    thefuck
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
    VISUAL = "nvim --clean";
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

      updateShell = "updateAll";

      secretAgentMan = "echo \"THEY'VE GIVEN YOU A NUMBER\" && eval `ssh-agent -s` ssh-add && echo \"AND TAKEN AWAY YOUR NAME\"";
      sshAgentMan = "secretAgentMan";
    };
    oh-my-zsh = {
      enable = true;
      plugins = ["git" "thefuck" "volta" "rust" "rvm" "zoxide"];
      theme = "bureau";
    };
  };

  programs.git = {
    enable = true;
    userName = "Daniel Alejandro Gallegos";
    userEmail = "daniel@tacowolf.net";
  };

  programs.btop = {
    enable = true;
    settings = {
      theme_background = false;
      update_ms = 666;
      vim_keys = true;
    };
  };

  programs.neovim = {
    enable = true;
    vimAlias = true;
    vimdiffAlias = true;
  };

  programs.home-manager.enable = true;
}
