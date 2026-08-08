{ chaos, ... }:
{
  chaos.all.hosts.includes = [ chaos.system.ssh ];
  chaos.all.users.includes = [ chaos.system.ssh-auth ];

  chaos.system.ssh = {
    nixos = {
      services.openssh = {
        enable = true;
        openFirewall = true;
        ports = [ 22 ];
        settings = {
          PasswordAuthentication = false;
          KbdInteractiveAuthentication = false;
          PermitRootLogin = "no";
        };
      };
    };
  };

  chaos.system.ssh-auth = {
    nixos =
      { user, ... }:
      {
        users.users.${user.name}.openssh.authorizedKeys.keys = user.sshAuthorizedKeys or [ ];
      };
  };
}
