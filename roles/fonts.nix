{ config, pkgs, lib, ... }:
{
  fonts = {
    fontconfig = {
      defaultFonts = {
        monospace = [ "JetBrainsMono" ];
        serif = [ "public-sans" ];
        sansSerif = [ "public-sans" ];
      };
    };
    packages = with pkgs; [
      dm-sans
      nerd-fonts.fira-code
      nerd-fonts.droid-sans-mono
      nerd-fonts.jetbrains-mono
      public-sans
    ];
  };
}
