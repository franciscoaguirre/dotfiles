{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
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
    neofetch
    ripgrep
    fd
  ];

  programs.starship = {
    enable = true;
    enableBashIntegration = true;
    enableZshIntegration = true;
  };

  programs.zellij = {
    enable = true;
    enableBashIntegration = true;
    enableZshIntegration = true;
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
