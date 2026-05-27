{ chaos, ... }:
{
  chaos.all._.hosts.includes = [ chaos.system._.ssh ];
  chaos.all._.users.includes = [ chaos.system._.ssh-auth ];

  chaos.system._.ssh = {
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

  chaos.system._.ssh-auth = {
    nixos =
      { user, ... }:
      {
        users.users.${user.name}.openssh.authorizedKeys.keys = user.sshAuthorizedKeys or [ ];
      };
  };
}
