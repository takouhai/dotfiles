{pkgs, ...}: {
  users.users.taco.packages = with pkgs; [
    lapce
    neovide
    kitty
    alacritty
  ];
}
