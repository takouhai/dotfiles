#!/usr/bin/env bash
echo "removing old home manager configs"
rm -fr ~/.config/home-manager
rm -fr ~/.config/nix/nix.conf

echo "creating a copy of the dotfiles into the config"
mkdir ~/.config/home-manager/
ln flake.nix ~/.config/home-manager/
ln flake.lock ~/.config/home-manager/
ln home.nix ~/.config/home-manager/
mkdir ~/.config/nix/
ln nix/nix.conf ~/.config/nix/nix.conf
