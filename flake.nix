{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.11";
    nixos-wsl = {
        url = "github:nix-community/NixOS-WSL/main";
        inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, nixos-wsl }: {
    nixosConfigurations = {
      skill-issue-wsl = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          nixos-wsl.nixosModules.default
          { wsl.enable = true; wsl.defaultUser = "fkozmik"; }
          ./configuration.nix
        ];
      };
    };
  };
}
