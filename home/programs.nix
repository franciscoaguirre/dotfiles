{ config, pkgs, lib, inputs, system, ... }:

{
  # Fcitx5 configuration for Japanese input
  xdg.configFile."fcitx5/profile".text = ''
    [Groups/0]
    Name=Default
    Default Layout=us-altgr-intl
    DefaultIM=mozc

    [Groups/0/Items/0]
    Name=keyboard-us-altgr-intl
    Layout=

    [Groups/0/Items/1]
    Name=mozc
    Layout=

    [GroupOrder]
    0=Default
  '';

  home.packages = with pkgs; [
    # Browsers
    brave

    # Code
    inputs.claude-code.packages.x86_64-linux.claude-code
  
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
    steam-run

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

  # home.sessionVariables = {
  #   ANTHROPIC_API_KEY = builtins.readFile /home/francisco/.secrets/anthropic-api-key;
  # };

  programs.direnv = {
    enable = true;
    nix-direnv.enable = true;
  };

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
      if test -f ~/.secrets/github-token
        set -x GITHUB_TOKEN (cat ~/.secrets/github-token)
      end
    '';
  };

  programs.starship = {
    enable = true;
    enableBashIntegration = true;
    enableFishIntegration = true;
  };

  programs.zellij = {
    enable = true;
    settings = {
      default_layout = "compact";
    };
  };

  programs.helix = {
    enable = true;
    package = inputs.nixpkgs-unstable.legacyPackages.${system}.helix;
    settings = {
      theme = "bogster";
      editor.line-number = "relative";
      keys.normal = {
        esc = ":w";
        "C-y" = ":sh zellij run -n Yazi -c -f -x 10%% -y 10%% --width 80%% --height 80%% -- bash ~/.config/helix/yazi-picker.sh open %{buffer_name}";
        space = {
          c = ":sh zellij run -c -d right -- claude";
        };
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

  dconf.settings = {
    "org/gnome/desktop/input-sources" = {
      sources = [ (lib.hm.gvariant.mkTuple [ "xkb" "us+altgr-intl" ]) ];
    };
  };
}
