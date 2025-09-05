{ pkgs, self, ... }:
{
  imports = [
    ../../modules/darwin/base.nix
    ../../modules/darwin/defaults.nix
  ];
  # Keep macOS names consistent with flake attr
  networking.hostName = "icebook";
  networking.computerName = "icebook";
  networking.localHostName = "icebook";
  
  # Required by nix-darwin for user-scoped defaults
  system.primaryUser = "mmf";
  environment.systemPackages = [
    pkgs.vim
    pkgs._1password-gui
    pkgs.vscode
    pkgs.git
  ];

  # Define the local macOS user so Home Manager can manage it
  users.users.mmf = {
    name = "mmf";
    home = "/Users/mmf";
    shell = pkgs.zsh;
  };

  # Home Manager integration
  home-manager.useGlobalPkgs = true;
  home-manager.useUserPackages = true;
  home-manager.users.mmf = {
    # Bind HM to the local user on macOS
    home.username = "mmf";
    home.homeDirectory = "/Users/mmf";
    # Reuse shared user profile
    imports = [ ../../home/common/default.nix ];
  };

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
