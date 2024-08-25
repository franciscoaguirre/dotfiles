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

    # Misc
    btop
  ];

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