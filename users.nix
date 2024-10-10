{ config, pkgs, ... }:
{
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
      ffmpeg
      firefox
      git 
      glibc
      gnome-extension-manager
      gnome-menus
      gnome.gnome-tweaks
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
      pika-backup
      powerline-fonts
      qemu_full
      spotify
      tailscale
      tmux
      virt-manager
      yubikey-manager-qt
    ]; 
  };
}
