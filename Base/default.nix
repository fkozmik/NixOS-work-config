{ config, pkgs, ... }:
{
  imports =
    [ ## Includes : 
      ./base.nix
      ./cosmic.nix
      ./gnome.nix
    ];
}
