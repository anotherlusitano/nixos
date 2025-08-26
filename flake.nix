{
  description = "My Homeserver >:D";

  inputs = { nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.05"; };

  outputs = { nixpkgs, ... }: {
    nixosConfigurations.homeserver = nixpkgs.lib.nixosSystem {
      system = "aarch64-linux";
      modules = [ ./hosts/homeserver/default.nix ];
    };
  };
}
