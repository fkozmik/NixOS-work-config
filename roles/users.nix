{ config, pkgs, pkgs-unstable, ... }:
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
    extraGroups = [ "networkmanager" "wheel" "docker" "scanner" "lp" "wireshark" ];
    shell = pkgs.zsh;
    packages = with pkgs; [
        # Laptop administration
        baobab
        dive
        fastfetch
        fprintd
        monitor
        nmon
        pavucontrol
        tree

        # Standard tooling
        ffmpeg
        firefox
        glibc
        google-chrome
        libreoffice
        logseq
        mattermost-desktop
        nextcloud-client
        oh-my-zsh
        powerline-fonts
        spotify
        spotify-player
        xournalpp

        # Network
        dig
        nmap
        openssl
        tailscale
        traceroute
        wireshark

        # Development
        claude-code
        docker
        gh
        gitFull
        k3s
        minikube
        p7zip
        php
        podman-desktop
        qemu_full
        tmux
        vim
        virt-manager

        # From unstable
        pkgs-unstable.jetbrains.phpstorm
    ]; 
  };
}
