{pkgs, ...}: {
  users.users.taco.packages = with pkgs; [
    spotify
    tidal-hifi
    jellyfin-media-player
  ];
}
