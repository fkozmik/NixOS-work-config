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
    extraGroups = [ "networkmanager" "wheel" "docker" "scanner" "lp" ];
    shell = pkgs.zsh;
    packages = with pkgs; [
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
      logiops
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
 
  systemd.services.logiops = {
    description = "Logitech Configuration Daemon";
    startLimitIntervalSec = 0;
    after = [ "multi-user.target" ];
    wantedBy = [ "graphical.target" ];
    wants = [ "multi-user.target" ];
    serviceConfig = {
      Type = "simple";
      ExecStart = "${pkgs.logiops}/bin/logid -v";
      User = "root";
    };
  };

  environment.etc."logid.cfg".text = ''
  devices: (
  {
    name: "MX Master 3S";
    
    smartshift: {
      on: true;
      threshold: 15;
    };
    
    hiresscroll: {
      hires: true;
      invert: true;
      target: false; 
    };
    
    dpi: 1000;
    
    buttons: (
      {
        cid: 0xc3;
        action = {
          type: "Gestures";
          gestures: (
            {
              direction: "Up";
              mode: "OnRelease";
              action = {
                type: "Keypress";
                keys: ["KEY_LEFTMETA", "KEY_ESC"];
              };
            },
            {
              direction: "Down";
              mode: "OnRelease";
              action = {
                type: "Keypress";
                keys: ["KEY_LEFTMETA", "KEY_W"];
              };
            },
            {
              direction: "Left";
              mode: "OnRelease";
              action = {
                type: "Keypress";
                keys: ["KEY_LEFTMETA", "KEY_V"];
              };
            },
            {
              direction: "Right";
              mode: "OnRelease";
              action = {
                type: "Keypress";
                keys: ["KEY_LEFTMETA", "KEY_T"];
              };
            },
            {
              direction: "None";
              mode: "OnRelease";
              action = {
                type: "Keypress";
                keys: ["KEY_LEFTMETA"];
              };
            }
          );
        };
      }
    );
  });
  '';
}
