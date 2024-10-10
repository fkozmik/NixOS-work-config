{ config, pkgs, ... }:

{
  imports =
    [ ## Includes : 
      ./aliases.nix
      ./hardware-configuration.nix
      ./networking-clients.nix
      ./system-packages.nix
      ./users.nix
    ];

  boot = {
    initrd.luks.devices."luks-35fbd3ab-af90-4560-a519-0a3b342c0694".device = "/dev/disk/by-uuid/35fbd3ab-af90-4560-a519-0a3b342c0694";
    loader = {
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
    };
  };

  networking.hostName = "skill-issue"; 
  networking.networkmanager.enable = true;

  time.timeZone = "Europe/Paris";


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

  ## Gnome, X11 and Keymap
  services.xserver = {
    enable = true;
    displayManager.gdm.enable = true;
    desktopManager.gnome.enable = true;
    xkb = {
      layout = "fr";
      variant = "azerty";
    };
  };

  console.keyMap = "fr";

  services.printing.enable = true;

  sound.enable = true;
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  programs = {
    direnv = {
      enable = true;
      loadInNixShell = true;
      nix-direnv.enable = true;
      };
    fish = {
      enable = false;
    };
    vim.defaultEditor = true;
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

  virtualisation = {
    docker.enable = true;
    libvirtd.enable = true;
  };

  fonts = {
    packages = with pkgs; [
      (nerdfonts.override { fonts = [ "JetBrainsMono" ]; })
    ];
    fontconfig = {
      defaultFonts = {
        monospace = [ "JetBrainsMono" ];
      };
    };
  };

  security.sudo.extraRules = [
    { groups = [ "sudo" ]; commands = [ "ALL" ]; }
    { users = [ "fkozmik" ];
      commands = [ 
      { 
        command = "/etc/profiles/per-user/fkozmik/bin/docker"; 
        options = [ "SETENV" "NOPASSWD" ]; 
      } 
      ]; 
    }
  ];

  # Allow unfree packages
  # nixpkgs.config.allowUnfree = true ### Doesn't work after bump to 24.05 
  nixpkgs.config = {
    allowUnfreePredicate = (pkg: true);
    permittedInsecurePackages = [
      "electron-27.3.11"
    ];
  };

  services = {
    openssh = {
      enable = true;
      settings.PasswordAuthentication = false;
      #settings.PermitRootLogin = "yes";
    };
    tailscale = {
      enable = true;
      useRoutingFeatures = "client";
    };
  };

  nix = {
    settings.auto-optimise-store = true;
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 7d";
    };
  };

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "23.11";
}
