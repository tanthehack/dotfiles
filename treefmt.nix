{ ... }:
{
  projectRootFile = "flake.nix";
  programs.nixfmt.enable = true;
  programs.mdformat.enable = true;
  settings.global.excludes = [ ];
}
