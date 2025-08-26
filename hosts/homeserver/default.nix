{ config, lib, pkgs, ... }:

{
  imports =
    [
      ./hardware-configuration.nix
      ../../modules/default.nix
    ];

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  networking.hostName = "homeserver";
  networking.networkmanager.enable = true;
  networking.firewall.allowedTCPPorts = [ 9090 ];

  time.timeZone = "Europe/Lisbon";

  i18n.defaultLocale = "en_US.UTF-8";
  console = {
    useXkbConfig = true;
  };

  users.users.king = {
    isNormalUser = true;
    extraGroups = [ "wheel" ];
    # packages = with pkgs; [
    #   tree
    # ];
  };


  environment.systemPackages = with pkgs; [
    vim
    git
    eza
    bat
    fastfetch
    raspberrypi-eeprom
  ];

  services.xserver.xkb.layout = "pt";
  services.openssh.enable = true;

  system.stateVersion = "25.11"; # Did you read the comment? No.
}

