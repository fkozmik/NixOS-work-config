{ config, pkgs, ... }:
{
  services = {
    hardware.bolt.enable = true;
    pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
      jack.enable = true;
      wireplumber.enable = true;
    };
    pulseaudio.enable = false;
  };

  systemd.services = {
    configure-sound-leds = rec {
      wantedBy = [ "sound.target" ];
      after = wantedBy;
      serviceConfig.Type = "oneshot";
      script = ''
        echo follow-capture > /sys/class/sound/ctl-led/mic/mode
        echo follow-capture > /sys/class/sound/ctl-led/speaker/mode
      '';
    };
  };
}

