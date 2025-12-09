{ config, pkgs, lib, ... }:
let
  folder = ./roles;
  nixFiles = lib.filterAttrs 
    (name: type: type == "regular" && lib.hasSuffix ".nix" name) 
    (builtins.readDir folder);
  rolesImport = lib.mapAttrsToList (name: _: folder + ("/" + name)) nixFiles;
in {

  # inherit imports;
  imports =
    [ ## Includes : 
      /home/fkozmik/_nixos-work-hidden
    ]++ rolesImport;

  console.keyMap = "fr";

  i18n = {
    defaultLocale = "fr_FR.UTF-8";
    extraLocaleSettings = {
      LC_ADDRESS = "fr_FR.UTF-8";
      LC_IDENTIFICATION = "fr_FR.UTF-8";
      LC_MEASUREMENT = "fr_FR.UTF-8";
      LC_MONETARY = "fr_FR.UTF-8";
      LC_NAME = "fr_FR.UTF-8";
      LC_NUMERIC = "fr_FR.UTF-8";
      LC_PAPER = "fr_FR.UTF-8";
      LC_TELEPHONE = "fr_FR.UTF-8";
      LC_TIME = "fr_FR.UTF-8";
    };
  };

  networking = {
    hostName = "skill-issue"; 
    networkmanager.enable = true;
  };
  
  nix = {
    nixPath = [ "nixos-config=/home/fkozmik/NixOS-work-config/configuration.nix" ];
    package = pkgs.nixVersions.nix_2_31;
    settings = {
      auto-optimise-store = true;
      experimental-features = [ "nix-command" "flakes" ];
    };
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 7d";
    };
  };

  nixpkgs.config = {
    allowUnfreePredicate = (pkg: true);
    permittedInsecurePackages = [
      "electron-27.3.11"
    ];
  };

  time.timeZone = "Europe/Paris";

  virtualisation = {
    docker = {
      enable = true;
      storageDriver = "overlay2";
    };
    libvirtd.enable = true;
  };

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "23.11"; ## Current 25.05
}
