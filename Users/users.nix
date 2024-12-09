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
      google-chrome
      jetbrains.phpstorm
      jetbrains-toolbox
      libreoffice
      logseq
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
      thefuck
      tmux
      virt-manager
      wireshark
      yubikey-manager-qt
    ]; 
  };
}
