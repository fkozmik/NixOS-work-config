{ config, pkgs, ... }:
{
    users.users.fkozmik = {
    isNormalUser = true;
    description = "fkozmik";
    extraGroups = [ "networkmanager" "wheel" "docker" ];
    shell = pkgs.zsh;
    packages = with pkgs; [
      _1password-gui
      chromium
      citrix_workspace
      docker
      fastfetch
      firefox
      git 
      glibc
      gnome.gnome-tweaks
      jetbrains.phpstorm
      libreoffice
      logseq
      mattermost-desktop
      nmon
      oh-my-zsh
      openssl
      php
      pika-backup
      powerline-fonts
      spotify
      tailscale
      tmux
      yubikey-manager-qt
    ]; 
  };
}
