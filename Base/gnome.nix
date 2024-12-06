{ config, pkgs, ... }:
{
    services.xserver.desktopManager.gnome.enable = true;
    environment.systemPackages = with pkgs; [
        gnome-extension-manager
        gnome-menus
        gnome-tweaks
        gnomeExtensions.dash-to-dock
        gnomeExtensions.arcmenu
    ];
}
