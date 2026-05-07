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
        dive
        fastfetch
        nmon
        tree

        # Standard tooling
        oh-my-zsh
        powerline-fonts

        # Network
        dig
        nmap
        openssl
        traceroute

        # Development
        claude-code
        docker
        gh
        gitFull
        k3s
        k9s
        kubernetes-helm
        minikube
        p7zip
        php
        tmux
        vim
    ];
  };
}
