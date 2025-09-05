{ config, pkgs, ... }:
{
  # Required for Home Manager; update only on breaking changes
  home.stateVersion = "25.05";

  # Program configs common to this user's profile
  programs.zsh.enable = true;
  programs.git.enable = true;

  # User packages managed by Home Manager (extend as needed)
  home.packages = with pkgs; [
    jq
  ];
}

