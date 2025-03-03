{ config, pkgs, ... }:
{
  security = {
    rtkit.enable = true;
    sudo.extraRules = [ # Allow all docker commands without password
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
      baobab
      citrix_workspace
      docker
      fastfetch
      ffmpeg
      firefox
      git
      gitcs
      gitg
      gti
      glibc
      google-chrome
      libreoffice
      logseq
      nmon
      oh-my-zsh
      openssl
      p7zip
      php
      powerline-fonts
      qemu_full
      spotify
      tailscale
      thefuck
      tmux
      tree
      virt-manager
      xournalpp
      yubikey-manager-qt
    ]; 
  };
}
