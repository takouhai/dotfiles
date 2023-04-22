{pkgs, ...}: {
  programs.zsh = {
    enable = true;
    localVariables = {
      UPDATE_ZSH_DAYS = 7;
      TERM = "xterm-256color";
      TERMINAL = "kitty";
      VISUAL = "nvim";
      EDITOR = "nvim";

      configDir = "$HOME/.dotfiles";
    };

    shellAliases = {
      please = "sudo";
      pushStack = "pushd $configDir";
      popStack = "popd $configDir";

      rebuildNixos = "please nixos-rebuild switch --flake .#";
      rebuildHome = "home-manager switch --flake .#taco";

      sourceZshrc = "source $HOME/.zshrc";
      updateZshrc = "sourceZshrc";

      updateChannel = "nix-channel --update";
      updateFlake = "nix flake update";

      updateHome = "pushStack && rebuildHome && popStack && sourceZshrc";
      updateNixos = "pushStack && rebuildNixos && popStack";

      updateAll = "pushStack && updateChannel && updateFlake && updateNixos && updateHome && popStack";

      editHome = "$EDITOR $configDir";

      cat = "bat";
      ls = "lsd";
    };

    initExtra = "eval \"$(starship init zsh)\"";

    oh-my-zsh = {
      enable = true;
      plugins = ["git" "rvm" "rust" "python" "thefuck" "zoxide" "volta"];
      theme = "agnoster";
    };
  };
}
