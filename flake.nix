{
  description = "Example nix-darwin system flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    nix-darwin.url = "github:nix-darwin/nix-darwin/master";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = inputs@{ self, nix-darwin, nixpkgs, home-manager }:
  {
    # Build darwin flake using:
    # $ darwin-rebuild build --flake .#icebook
    darwinConfigurations."icebook" = nix-darwin.lib.darwinSystem {
      specialArgs = { inherit self; };
      modules = [
        # Enable Home Manager on macOS
        home-manager.darwinModules.home-manager
        ./hosts/icebook
      ];
    };
  };
}
