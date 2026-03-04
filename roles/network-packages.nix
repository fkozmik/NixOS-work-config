{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
        dig
        nmap
        tailscale
        traceroute
        wireshark
    ];
}