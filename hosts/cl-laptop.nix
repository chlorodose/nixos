{...}:
{
  host.isDesktop = true;

  boot.initrd.availableKernelModules = [ "xhci_pci" "thunderbolt" "nvme" "usb_storage" "sd_mod" ];
  boot.initrd.kernelModules = [ ];
  boot.kernelModules = [ "kvm-intel" ];
  boot.extraModulePackages = [ ];

  fileSystems."/" =
    {
      device = "/dev/disk/by-uuid/7598fba8-77cd-4567-84e2-7749e0dced5c";
      fsType = "btrfs";
      options = [ "subvol=@" ];
    };

  fileSystems."/boot" =
    {
      device = "/dev/disk/by-uuid/FF5D-B7B4";
      fsType = "vfat";
      options = [ "fmask=0077" "dmask=0077" ];
    };

  swapDevices = [{ device = "/dev/disk/by-uuid/ce7ab5ac-18c2-47c6-a967-040d948f38d8"; }];

  nixpkgs.hostPlatform = "x86_64-linux";
  hardware.cpu.intel.updateMicrocode = true;

  networking.networkmanager.enable = true;
}