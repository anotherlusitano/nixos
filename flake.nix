{
  description = "My Homeserver >:D";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.05";

    nixvim = {
      url = "github:nix-community/nixvim/nixos-25.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { nixpkgs, nixvim, ... }: {
    nixosConfigurations.homeserver = nixpkgs.lib.nixosSystem {
      system = "aarch64-linux";
      modules = [ ./hosts/homeserver/default.nix nixvim.nixosModules.nixvim ];
    };
  };
}
