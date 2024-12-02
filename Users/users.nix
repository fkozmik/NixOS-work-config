{ config, pkgs, ... }:
{
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
}
