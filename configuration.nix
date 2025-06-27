{ config, pkgs, lib, ... }:
{
  imports =
    [ ## Includes : 
      ./cachix.nix
      ./DesktopEnvironments
      ./Users
      /home/fkozmik/_nixos-work-hidden
    ];

  console.keyMap = "fr";

  fonts = {
    packages = with pkgs; [
      nerd-fonts.fira-code
      nerd-fonts.droid-sans-mono
      nerd-fonts.jetbrains-mono
    ];
    fontconfig = {
      defaultFonts = {
        monospace = [ "JetBrainsMono" ];
      };
    };
  };

  hardware.pulseaudio.enable = false;

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
  
  nix.nixPath = [ "nixos-config=/home/fkozmik/NixOS-work-config/configuration.nix" ];
  nix.package = pkgs.nixVersions.nix_2_28;

  time.timeZone = "Europe/Paris";

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "23.11"; ## Current 25.05
}
