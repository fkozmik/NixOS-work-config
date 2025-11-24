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
      nextcloud-client
      nmon
      oh-my-zsh
      openssl
      p7zip
      php
#      plymouth
      powerline-fonts
      qemu_full
      spotify
      spotify-player
      tailscale
      thefuck
      tmux
      tree
      virt-manager
      wireshark
      xournalpp
      yubikey-manager-qt
    ]; 
  };
 
  systemd.services = {
    configure-sound-leds = rec {
      wantedBy = [ "sound.target" ];
      after = wantedBy;
      serviceConfig.Type = "oneshot";
      script = ''
        echo follow-mute > /sys/class/sound/ctl-led/mic/mode
        echo follow-mute > /sys/class/sound/ctl-led/speaker/mode
      '';
    };
  };
}
