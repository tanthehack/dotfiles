{ pkgs, ... }:
{
  home.username = "tanielou";
  home.homeDirectory = "/Users/tanielou";

  home.packages = [
    pkgs.nil
    pkgs.nixd

    pkgs.nodejs
    pkgs.bun
    pkgs.gh

    pkgs.appcleaner
    
    pkgs.shopify-cli

    pkgs.ffmpeg_8
  ];

  programs.git = {
    enable = true;

    settings = {
      user.name = "Tanyalouise";
      user.email = "tanielou10@gmail.com";

      alias = {
        sw = "switch";
        st = "status";
        br = "branch";
        ci = "commit";
      };

      init.defaultBranch = "main";
      push.autoSetupRemote = true;

      # gotten from https://blog.gitbutler.com/how-git-core-devs-configure-git/
      column.ui = "auto";
      branch.sort = "-committerdate";
      tag.sort = "version:refname";
      diff.algorithm = "histogram";
      diff.colorMoved = "plain";
      diff.renames = true;
      push.followTags = true;
      help.autocorrect = "prompt";
      commit.verbose = true;
      rerere.enabled = true;
      rerere.autoupdate = true;
      merge.conflictstyle = "zdiff3";
    };
  };

  programs.starship = {
    enable = true;

    settings = {
      character = {
        success_symbol = "[➜](bold green)";
        error_symbol = "[✖](bold red)";
      };
      hostname = {
        ssh_only = false;
        format = "[$hostname](bold orange): ";
      };
      username = {
        show_always = true;
        format = "[$user](bold lavender)[@](bold yellow)";
      };
    };
  };

  xdg.configFile."nixpkgs/config.nix".text = "{ allowUnfree = true; }";

  # This value determines the Home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new Home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update Home Manager without changing this value. See
  # the Home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "25.05";
}
