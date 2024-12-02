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

  security = {
    rtkit.enable = true;
    sudo.extraRules = [
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

  users.users.fkozmik = {
    isNormalUser = true;
    description = "fkozmik";
    extraGroups = [ "networkmanager" "wheel" "docker" ];
    shell = pkgs.zsh;
    packages = with pkgs; [
      # _1password-gui
      citrix_workspace
      docker
      fastfetch
      ffmpeg
      firefox
      git 
      glibc
      gnome-extension-manager
      gnome-menus
      gnome-tweaks
      gnomeExtensions.dash-to-dock
      gnomeExtensions.arcmenu
      google-chrome
      jetbrains.phpstorm
      jetbrains-toolbox
      libreoffice
      logseq
      mattermost-desktop
      nmon
      neovim
      oh-my-zsh
      openssl
      php
      powerline-fonts
      qemu_full
      spotify
      tailscale
      thefuck
      tmux
      virt-manager
      yubikey-manager-qt
    ]; 
  };

  virtualisation = {
    docker.enable = true;
    libvirtd.enable = true;
  };
}
