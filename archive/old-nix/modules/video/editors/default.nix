{pkgs, ...}: {
  users.users.taco.packages = with pkgs; [
    kdenlive
    davinci-resolve
  ];
}
