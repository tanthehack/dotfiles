{ inputs, config, ... }:
{
  system.primaryUser = "tanielou";
  users.users.tanielou.home = "/Users/tanielou";

  # List packages installed in system profile. To search by name, run:
  # $ nix-env -qaP | grep wget
  environment.systemPackages = [ ];

  # Enable alternative shell support in nix-darwin.
  # programs.fish.enable = true;

  # Set Git commit hash for darwin-version.
  system.configurationRevision = inputs.self.rev or inputs.self.dirtyRev or null;

  # Used for backwards compatibility, please read the changelog before changing.
  # $ darwin-rebuild changelog
  system.stateVersion = 6;

  # The platform the configuration will be used on.
  nixpkgs.hostPlatform = "aarch64-darwin";

  # Use Determinate Nix
  nix.enable = false;

  # Nix settings
  nixpkgs.config.allowUnfree = true;
  nixpkgs.flake.source = inputs.nixpkgs;
  nix.settings = {
    experimental-features = "nix-command flakes";
    optimise.automatic = true;
    gc = {
      automatic = true;
    };

    channel.enable = false;
  };

  # Touch ID for sudo
  security.pam.services.sudo_local.touchIdAuth = true;

  # Add direnv
  programs.direnv.enable = true;
  programs.direnv.nix-direnv.enable = true;

  # Homebrew
  homebrew = {
    enable = true;
    onActivation = {
      cleanup = "zap";
      autoUpdate = true;
      upgrade = true;
    };
    # so that nix-darwin knows about the taps nix-homebrew brings in
    taps = builtins.attrNames config.nix-homebrew.taps;
    greedyCasks = true;
    brews = [
      "mas" # needed for `masApps` down below
      "supabase"
      "pnpm"
    ];
    casks = [
      "orbstack" # needs Sonoma+ to be installed
      "cloudflare-warp"
      "warp"
      "zed"
      "mounty"
      "macfuse"
    ];
    masApps = {
      Telegram = 747648890;
    };
  };
}
