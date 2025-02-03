{ config, pkgs, ... }:
{
  imports =
    [ ## Includes : 
      ./aliases.nix
      ./base.nix
      ./editors.nix
      ./users.nix
    ];
}
