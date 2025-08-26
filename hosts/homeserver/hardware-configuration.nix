{ lib, pkgs, modulesPath, ... }:

{
  imports = [ (modulesPath + "/installer/scan/not-detected.nix") ];

  boot = {
    loader = {
      grub.enable = false;
      generic-extlinux-compatible.enable = true;
    };

    initrd = {
      availableKernelModules = [ "xhci_pci" "usbhid" "usb_storage" ];
      kernelModules = [ ];
    };

    extraModulePackages = [ ];
    kernelModules = [ ];
    kernelPackages = pkgs.linuxKernel.packages.linux_rpi4;
  };

  swapDevices = [ ];

  # Stuff from [here](https://nix.dev/tutorials/nixos/installing-nixos-on-a-raspberry-pi)
  fileSystems = {
    "/" = {
      device = "/dev/disk/by-label/NIXOS_SD";
      fsType = "ext4";
      options = [ "noatime" ];
    };
  };

  nixpkgs.hostPlatform = lib.mkDefault "aarch64-linux";
}
