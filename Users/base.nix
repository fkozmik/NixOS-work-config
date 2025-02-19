{ config, pkgs, ... }:
{
  nix = {
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

  powerManagement.powertop.enable = true; # Battery management

  programs = {
    _1password-gui = {
      enable =  true;
      polkitPolicyOwners = [ "fkozmik" ];
    };
    thefuck.enable = true;
    vim = {
      defaultEditor = true;
      enable = true;
    };
    virt-manager.enable = true;
    zsh = {
      enable = true;
      enableCompletion = true;
      autosuggestions.enable = true; 
      syntaxHighlighting.enable = true;
      ohMyZsh = {
        enable = true;
        theme = "agnoster";
        plugins = [
          "docker-compose"
          "systemadmin"
          "tailscale"
          "thefuck"
          "vi-mode"
        ];
      };
    };
  };

  services = {
    openssh = {
      enable = true;
      settings.PasswordAuthentication = false;
      #settings.PermitRootLogin = "yes";
    };
    pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
    };
    power-profiles-daemon.enable = false; # Battery management
    printing.enable = true;
    tailscale = {
      enable = true;
      useRoutingFeatures = "client";
    };
    tlp = { # Battery management
      enable = true;
      settings = {
        CPU_BOOST_ON_AC = 1;
        CPU_BOOST_ON_BAT = 0;
        CPU_SCALING_GOVERNOR_ON_AC = "performance";
        CPU_SCALING_GOVERNOR_ON_BAT = "powersave";
      };
    };
    system76-scheduler.settings.cfsProfiles.enable = true; # Battery management, thanks system76 !
    xserver = {
      enable = true;
      displayManager.gdm.enable = true;
      xkb = {
        layout = "fr";
        variant = "azerty";
      };
    };
  };

  virtualisation = {
    docker.enable = true;
    libvirtd.enable = true;
  };
}
