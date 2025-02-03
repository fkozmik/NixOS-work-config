{ config, pkgs, ... }:
{
  imports =
    [ ## Includes : 
      ./cosmic.nix
      ./gnome.nix
    ];
}
