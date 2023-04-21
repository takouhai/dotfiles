{pkgs, user, ...}: {
  users.users.${user}.packages = with pkgs; [
    spotify
    tidal-hifi
    jellyfin-media-player
  ];
}
