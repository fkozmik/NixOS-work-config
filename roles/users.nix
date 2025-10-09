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
      adobe-reader
      baobab
      docker
      fastfetch
      ffmpeg
      firefox
      fprintd
      gitFull
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

  nixpkgs.config = {
    allowUnfreePredicate = (pkg: true);
    permittedInsecurePackages = [
      "adobe-reader-9.5.5"
      "electron-27.3.11"
      "yubikey-manager-qt-1.2.5"
    ];
  };

}
