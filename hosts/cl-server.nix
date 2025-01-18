{lib, ...}:
with lib;
{
  host.isDesktop = false;
  host.services = {
    ddns.enable = true;
    ups.enable = true;
    mihomo.enable = true; # TODO: Replace mihomo to other proxy service
  };

  boot.initrd.availableKernelModules = [ "xhci_pci" "ehci_pci" "ahci" "nvme" "sd_mod" ];
  boot.initrd.kernelModules = [ ];
  boot.kernelModules = [ "kvm-intel" ];
  boot.extraModulePackages = [ ];

  fileSystems."/" =
    {
      device = "/dev/disk/by-uuid/f897c054-be68-423a-b558-089cc3d5e302";
      fsType = "ext4";
    };

  fileSystems."/boot" =
    {
      device = "/dev/disk/by-uuid/5AFD-4369";
      fsType = "vfat";
      options = [ "rw" "sync" "nosuid" "nodev" "noexec" "uid=0" "gid=0" "umask=077" "utf8" "errors=remount-ro" ];
    };

  fileSystems."/mnt" =
    {
      device = "/dev/disk/by-uuid/e0837679-202c-4922-925e-40abd604b510";
      fsType = "bcachefs";
    };
  systemd.extraConfig = mkForce "DefaultDeviceTimeoutSec = 3s";
  swapDevices = [{ device = "/dev/disk/by-uuid/126e2555-a716-46e1-81a1-d065f29c6084"; }];

  nixpkgs.hostPlatform = "x86_64-linux";
  hardware.cpu.intel.updateMicrocode = true;
}