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
    extraGroups = [ "networkmanager" "wheel" "docker" "scanner" "lp" "wireshark" ];
    shell = pkgs.zsh;
    packages = with pkgs; [
      baobab
      dive
      docker
      fastfetch
      ffmpeg
      firefox
      fprintd
      gh
      gitFull
      glibc
      google-chrome
      libreoffice
      logseq
      mattermost-desktop
      monitor
      nextcloud-client
      nmap
      nmon
      oh-my-zsh
      openssl
      p7zip
      pavucontrol
      php
#      plymouth
      powerline-fonts
      qemu_full
      spotify
      spotify-player
      tailscale
      tmux
      tree
      virt-manager
      wireshark
      xournalpp
    ]; 
  };
 
  systemd.services = {
    configure-sound-leds = rec {
      wantedBy = [ "sound.target" ];
      after = wantedBy;
      serviceConfig.Type = "oneshot";
      script = ''
        echo follow-capture > /sys/class/sound/ctl-led/mic/mode
        echo follow-capture > /sys/class/sound/ctl-led/speaker/mode
      '';
    };
  };
}
