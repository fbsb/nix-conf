{ chaos, ... }:
{
  chaos.all.hosts.includes = [ chaos.system.pipewire ];

  chaos.system.pipewire = {
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
