{config, pkgs, lib,...}: {
  users.users.taco = {
    isNormalUser = true;
    description = "taco";
    extraGroups = [ "networkmanager" "wheel" ];
  };
}
