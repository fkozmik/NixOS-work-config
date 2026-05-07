{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.11";
    nixpkgs-unstable.url = "github:NixOS/nixpkgs/nixos-unstable";
    nixos-wsl = {
        url = "github:nix-community/NixOS-WSL/main";
        inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, nixpkgs-unstable, nixos-wsl }: {
    nixosConfigurations = {
      skill-issue-wsl = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = {
          pkgs-unstable = import nixpkgs-unstable {
            system = "x86_64-linux";
            config.allowUnfree = true;
          };
        };
        modules = [
          nixos-wsl.nixosModules.default
          { wsl.enable = true; wsl.defaultUser = "fkozmik"; }
          ./configuration.nix
        ];
      };
    };
  };
}
