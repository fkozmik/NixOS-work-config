{ config, pkgs, ... }:

{
  imports =
    [ ## Includes : 
      ./aliases.nix
      ./hardware-configuration.nix
      ./networking-clients.nix
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
    defaultLocale = "en_GB.UTF-8";
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
    vim = {
      defaultEditor = true;
    };
    zsh = {
      enable = false;
      ohMyZsh = {
        enable = false;
        theme = "agnoster";
        plugins = [
          "sudo"
          "systemadmin"
          "vi-mode"
          "direnv"
        ];
      };
    };
  };

  virtualisation.docker.enable = true;

  users.users.fkozmik = {
    isNormalUser = true;
    description = "fkozmik";
    extraGroups = [ "networkmanager" "wheel" "docker" ];
    shell = pkgs.zsh;
    packages = with pkgs; [
      _1password-gui
      citrix_workspace
      docker
      fastfetch
      firefox
      git 
      glibc
      gnome.gnome-tweaks
      gparted
      jetbrains.phpstorm
      libreoffice
      logseq
      mattermost-desktop
      nix-direnv
      nmon
      oh-my-zsh
      openssl
      pika-backup
      php
      spotify
      tailscale
      tmux
      yubikey-manager-qt ## I know, not alphabetically in order -_-
      (vscode-with-extensions.override {
        vscode = vscodium;
        vscodeExtensions = with vscode-extensions; [
          bbenoist.nix
          ms-azuretools.vscode-docker
          ms-python.python
          ms-vscode-remote.remote-ssh
        ] ++ pkgs.vscode-utils.extensionsFromVscodeMarketplace [
          {
            name = "Ansible";
            publisher = "redhat";
            version = "24.8.3";
            sha256 = "8DlOB3bog/VeW5YAU2DQhlkvCf+3JqVJNbPJJJWYjI4=";
          }
          {
            name = "theme-dracula";
            publisher = "dracula-theme";
            version = "2.25.0";
            sha256 = "02aTnAvUJ/uCMNtjoCSQDlqwq5TwMwsEqWf/XRYnzT8=";
          }
          {
            name = "git-graph";
            publisher = "mhutchie";
            version = "1.30.0";
            sha256 = "sHeaMMr5hmQ0kAFZxxMiRk6f0mfjkg2XMnA4Gf+DHwA=";
          } 
          {
            name = "mac-vim-ron";
            publisher = "Dashiell";
            version = "0.0.1";
            sha256 = "WCh9Kam2McWmx668or6hD2ZwhzgikB6OXPKnZRDHRt0=";
          } 
          {
            name = "nix-env-selector";
            publisher = "arrterian";
            version = "1.0.11";
            sha256 = "74ad1a207f2d906ffd5066e534ed16c31240041104284cb89d2988c1d0e97f84";
          }
          {
            name = "vscode-workspace-explorer";
            publisher = "tomsaunders";
            version = "1.5.0";
            sha256 = "E7QVsUTLc3PP+xztFZlv5vUYpMR8ds+0VRZkg0Y6dAA=";
          }
          {
            name = "vscode-yaml";
            publisher = "redhat";
            version = "1.15.0";
            sha256 = "NhlLNYJryKKRv+qPWOj96pT2wfkiQeqEip27rzl2C0M=";
          }
        ];
      })
    ]; 
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
    # Allow execution of any command by all users in group sudo,requiring a password.
    # Allow certain specific commands without the use of a password
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

  environment.systemPackages = with pkgs; [
    vim
  ];

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
