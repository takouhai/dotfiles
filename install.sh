#!/usr/bin/env bash
echo "removing old home manager configs"
rm ~/.config/home-manager/*
rm ~/.config/nix/nix.conf

echo "creating a copy of the dotfiles into the config"
ln flake.nix ~/.config/home-manager
ln flake.lock ~/.config/home-manager
ln home.nix ~/.config/home-manager
ln nix/nix.conf ~/.config/nix/nix.conf
