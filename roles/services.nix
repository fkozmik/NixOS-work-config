{ config, pkgs, ... }:
{
  services = {
    atuin.enable = true;
    openssh = {
      enable = true;
      settings.PasswordAuthentication = false;
      #settings.PermitRootLogin = "yes";
    };
  };
}

