{ config, pkgs, ... }:
{
  imports =
    [ ## Includes : 
      ./aliases.nix
      ./base.nix
      ./battery-management.nix
      ./editors.nix
      ./users.nix
    ];
}
