{ config, pkgs, ... }:
{
  nix = {
    package = pkgs.nixVersions.nix_2_28;
    settings = {
      auto-optimise-store = true;
      experimental-features = [ "nix-command" "flakes" ];
    };
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 7d";
    };
  };

  nixpkgs.config = {
    allowUnfreePredicate = (pkg: true);
    permittedInsecurePackages = [
      "electron-27.3.11"
      "yubikey-manager-qt-1.2.5"
    ];
  };

  powerManagement.powertop.enable = true; # Battery management

  programs = {
    _1password-gui = {
      enable =  true;
      polkitPolicyOwners = [ "fkozmik" ];
    };
    git = {
      config = {
        column = { ui = "auto"; };
        commit = {verbose = "true"; };
        help = { autocorrect = "prompt"; };
        init = { defaultBranch = "main"; };
        push = { autoSetupRemote = "true"; };
        rebase = { autoStash = "true"; };
        rebase = { updateRefs = "true"; };
        rerere = { enabled = "true"; };
      };
      enable = true;
      prompt.enable = true;
    };
      thefuck.enable = true;
    vim = {
      defaultEditor = true;
      enable = true;
    };
    virt-manager.enable = true;
    zsh = {
      enable = true;
      enableCompletion = true;
      autosuggestions.enable = true; 
      syntaxHighlighting.enable = true;
      ohMyZsh = {
        enable = true;
        theme = "agnoster";
        plugins = [
          "docker-compose"
          "sudo"
          "systemadmin"
          "tailscale"
          "vi-mode"
        ];
      };
    };
  };

  services = {
    avahi = {
      enable = true;
      nssmdns4 = true;
      openFirewall = true;
    };
    openssh = {
      enable = true;
      settings.PasswordAuthentication = false;
      #settings.PermitRootLogin = "yes";
    };
    pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
    };
    printing.enable = true;
    pulseaudio.enable = false;
    tailscale = {
      enable = true;
      useRoutingFeatures = "client";
    };
    xserver = {
      enable = true;
      displayManager.gdm.enable = true;
      xkb = {
        layout = "fr";
        variant = "azerty";
      };
    };
  };

  virtualisation = {
    docker = {
      enable = true;
      storageDriver = "overlay2";
    };
    libvirtd.enable = true;
  };
}
