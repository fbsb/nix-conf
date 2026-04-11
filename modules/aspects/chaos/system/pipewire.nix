{ chaos, ... }:
{
  chaos.all._.hosts.includes = [ chaos.system._.pipewire ];

  chaos.system._.pipewire = {
    nixos = {
      security.rtkit.enable = true;
      services.pipewire = {
        enable = true;
        alsa.enable = true;
        alsa.support32Bit = true;
        pulse.enable = true;
        audio.enable = true;
        wireplumber.enable = true;
      };
    };
  };
}
