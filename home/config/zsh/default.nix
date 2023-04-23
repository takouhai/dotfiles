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

      # push the stack so it's always available when we run the commands 
      pushStack = "pushd $configDir";
      # pop it so it's not there when we're done
      popStack = "popd";

      # rebuild the system based on the flake 
      # first one autodetects your host
      rebuildNixos = "please nixos-rebuild switch --flake .#";
      # others explicitly call for a host defined in the flake
      rebuildMyna = "please nixos-rebuild switch --flake .#myna";
      rebuildFishcrow = "please nixos-rebuild switch --flake .#fishcrow";

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

      updateHome = "pushStack && rebuildHome && popStack && updateZshrc";
      updateNixos = "pushStack && rebuildNixos && popStack";
      updateSystem = "pushStack && rebuildNixos && rebuildHome && popStack && cd $configDir";
      updateAll = "pushStack && updateChannel && updateFlake && rebuildNixos && rebuildHome && popStack";

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
