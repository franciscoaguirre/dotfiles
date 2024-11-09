{ config, pkgs, ... }:

{
  imports = [
    ../../home/programs.nix
  ];

  home.username = "francisco";
  home.homeDirectory = "/home/francisco";

  home.stateVersion = "24.05";
  programs.home-manager.enable = true;
}
