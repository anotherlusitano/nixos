{ pkgs, ... }:

{
  imports = [ ./editor.nix ];

  environment.systemPackages = with pkgs; [
    # Dev stuff
    vim
    git
    lazygit
    eza
    bat

    # Nix stuff
    nixd
    nil
    nixfmt-rfc-style

    # Funny stuff
    fastfetch
    raspberrypi-eeprom
  ];
}
