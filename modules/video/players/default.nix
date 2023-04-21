{pkgs, ...}: {
  users.users.taco.packages = with pkgs; [
    jellyfin-media-player
    mpv
    vlc
  ];
}
