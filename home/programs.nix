{ config, pkgs, inputs, system, ... }:

{
  home.packages = with pkgs; [
    # Browsers
    brave
  
    # Notes
    obsidian

    # Messaging
    discord

    # Creative
    inkscape
    krita
    blender

    # Games
    steam

    # Misc
    btop
    bat
    neofetch
    ripgrep
    fd
    deluge
    vlc
    ledger-live-desktop
  ];

  programs.firefox = {
    enable = true;
    package = inputs.nixpkgs-unstable.legacyPackages.${system}.firefox;
  };

  # Music.
  programs.ncspot = {
    enable = true;
    package = inputs.nixpkgs-unstable.legacyPackages.${system}.ncspot;
  };

  programs.bash = {
    enable = true;
    initExtra = ''
      # Check if this is an interactive shell, then launch fish
      if [ -t 1 ]; then
        exec fish
      fi
    '';
  };

  # Install fish.
  programs.fish = {
    enable = true;
    shellAliases = {
      g = "git";
    };
    shellAbbrs = {
      dev = "nix develop -c fish";
    };
    interactiveShellInit = ''
      set fish_greeting # Disable greeting
    '';
  };

  programs.starship = {
    enable = true;
    enableBashIntegration = true;
    enableFishIntegration = true;
  };

  programs.zellij = {
    enable = true;
    enableBashIntegration = true;
    enableFishIntegration = true;
    settings = {
      default_layout = "compact";
    };
  };

  programs.helix = {
    enable = true;
    settings = {
      theme = "bogster";
      editor.line-number = "relative";
      keys.normal = {
        esc = ":w";
      };
    };
  };

  programs.git = {
    enable = true;
    userName = "Francisco Aguirre";
    userEmail = "franciscoaguirreperez@gmail.com";
    extraConfig = {
      init.defaultBranch = "main";
      core.editor = "hx";
    };
    aliases = {
      s = "status";
      a = "add";
      co = "checkout";
      b = "branch";
      l = "log";
      d = "diff";
      ci = "commit";
      amend = "commit --amend";
      ps = "push";
      pl = "pull";
      re = "rebase -i";
      continue = "rebase --continue";
      abort = "rebase --abort";
    };
  };
}
