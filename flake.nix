{
    description = "Second NixOS config try";

    inputs = {
        nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.05";

        home-manager.url = "github:nix-community/home-manager/release-24.05";
        home-manager.inputs.nixpkgs.follows = "nixpkgs";

        hyprland.url = "github:hyprwm/Hyprland";

        swww.url = "github:LGFae/swww";
    };

    outputs = {
        self,
        nixpkgs,
        home-manager,
        hyprland,
        ...
    } @ inputs: let
        inherit (self) outputs;
    in {
        nixosConfigurations = {
            imprimis = nixpkgs.lib.nixosSystem {
                specialArgs = {inherit inputs outputs;};
                modules = [./nixos/configuration.nix];
            };
        };

        homeConfigurations = {
            "user@imprimis" = home-manager.lib.homeManagerConfiguration {
                pkgs = nixpkgs.legacyPackages.x86_64-linux;
                extraSpecialArgs = {inherit inputs outputs;};
                modules = [./home-manager/home.nix];
            };
        };
    };
}
