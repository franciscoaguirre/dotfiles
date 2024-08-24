{ config, pkgs, ... }:

{
  programs.bash = {
    shellAliases = {
      g = "git";
    };
  };
}
