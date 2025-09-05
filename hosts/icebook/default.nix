{ pkgs, self, ... }:
{
  # Keep macOS names consistent with flake attr
  networking.hostName = "icebook";
  networking.computerName = "icebook";
  networking.localHostName = "icebook";
  environment.systemPackages = [
    pkgs.vim
    pkgs._1password-gui
    pkgs.vscode
    pkgs.git
  ];

  # Flakes + unfree
  nix.settings.experimental-features = "nix-command flakes";
  nixpkgs.config.allowUnfree = true;
  nix.enable = false;

  # Track revision used for this build
  system.configurationRevision = self.rev or self.dirtyRev or null;

  # Darwin defaults
  system.stateVersion = 6;
  nixpkgs.hostPlatform = "aarch64-darwin";
}
