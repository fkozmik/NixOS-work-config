{ config, pkgs, ... }:
{
  imports =
    [ ## Includes : 
      ./aliases.nix
      ./editors.nix
      ./users.nix
    ];
}
