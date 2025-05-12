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
        {
          command = "/run/current-system/sw/bin/systemctl restart bluetooth";
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
      spotify-player
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
