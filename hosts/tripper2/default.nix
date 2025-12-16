{ inputs, ... }:
{
  imports = [
    inputs.home-manager.nixosModules.home-manager
  ];

  # Home Manager wiring
  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;

    users.nobr = {
      imports = [ ../../modules/home-manager ];
    };

    extraSpecialArgs = { inherit inputs; };
    backupFileExtension = "backup";
  };
}
