{
  imports = [
    ./hardware-configuration.nix
    ./tools/default.nix
    ../../modules/default.nix
  ];

  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  nixpkgs.config.allowUnfree = true;

  networking.hostName = "homeserver";
  networking.networkmanager.enable = true;
  networking.firewall.allowedTCPPorts = [ 9090 80 443 25565 ];

  time.timeZone = "Europe/Lisbon";

  i18n.defaultLocale = "en_US.UTF-8";
  console = { useXkbConfig = true; };

  users.users.king = {
    isNormalUser = true;
    extraGroups = [ "wheel" "minecraft" ];
    # packages = with pkgs; [
    #   tree
    # ];
  };

  services.xserver.xkb.layout = "pt";
  services.openssh.enable = true;

  system.stateVersion = "25.11"; # Did you read the comment? No.
}
