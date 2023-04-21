{pkgs, ...}: {
  users.users.taco = {
    packages = with pkgs; [
      # web browsers
      firefox
      ungoogled-chromium
      brave
      librewolf
      tor-browser-bundle-bin

      # note taking
      logseq

      # office suite
      libreoffice

      # calculator
      speedcrunch

      # comms
      tdesktop
      discord

      # visual editing
      figma-linux
    ];
  };
}
