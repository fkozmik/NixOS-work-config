{ config, pkgs, ... }:
{
  nix = {
    settings.auto-optimise-store = true;
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

  programs = {
    _1password-gui = {
      enable =  true;
      polkitPolicyOwners = [ "fkozmik" ];
    };
    direnv = {
      enable = true;
      loadInNixShell = true;
      nix-direnv.enable = true;
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
          "sudo"
          "systemadmin"
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
    printing.enable = true;
    tailscale = {
      enable = true;
      useRoutingFeatures = "client";
    };
    xserver = {
      enable = true;
      displayManager.gdm.enable = true;
      desktopManager.gnome.enable = true;
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
