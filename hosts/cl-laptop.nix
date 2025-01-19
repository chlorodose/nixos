{...}:
{
  host.isDesktop = true;
  user.users.chlorodose.enable = true;

  boot.initrd.availableKernelModules = [ "xhci_pci" "thunderbolt" "nvme" "usb_storage" "sd_mod" ];
  boot.initrd.kernelModules = [ ];
  boot.kernelModules = [ "kvm-intel" ];
  boot.extraModulePackages = [ ];

  fileSystems."/" =
    {
      device = "/dev/disk/by-uuid/2635333a-5496-4ebb-80c0-48ec5d472167";
      fsType = "ext4";
    };

  fileSystems."/boot" =
    {
      device = "/dev/disk/by-uuid/AEBE-FAD1";
      fsType = "vfat";
      options = [ "fmask=0077" "dmask=0077" ];
    };

  swapDevices = [{ device = "/dev/disk/by-uuid/b7440ed5-f201-4976-8556-2b14c4c05f28"; }];

  nixpkgs.hostPlatform = "x86_64-linux";
  hardware.cpu.intel.updateMicrocode = true;

  networking.networkmanager.enable = true;
  networking.proxyHost = "192.168.0.1";
}