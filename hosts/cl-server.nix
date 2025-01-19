{ pkgs, lib, ... }:
with lib; {
  host.isDesktop = false;
  host.services = {
    ddns.enable = true;
    ups.enable = true;
    mihomo.enable = true; # TODO: Replace mihomo to other proxy service
  };

  boot.initrd.availableKernelModules =
    [ "xhci_pci" "ehci_pci" "ahci" "nvme" "sd_mod" ];
  boot.initrd.kernelModules = [ ];
  boot.kernelModules = [ "kvm-intel" ];
  boot.extraModulePackages = [ ];

  fileSystems."/" = {
    device = "/dev/disk/by-uuid/f897c054-be68-423a-b558-089cc3d5e302";
    fsType = "ext4";
  };

  fileSystems."/boot" = {
    device = "/dev/disk/by-uuid/5AFD-4369";
    fsType = "vfat";
    options = [
      "rw"
      "sync"
      "nosuid"
      "nodev"
      "noexec"
      "uid=0"
      "gid=0"
      "umask=077"
      "utf8"
      "errors=remount-ro"
    ];
  };

  fileSystems."/mnt" = {
    device = "/dev/disk/by-uuid/e0837679-202c-4922-925e-40abd604b510";
    fsType = "bcachefs";
  };
  systemd.extraConfig = mkForce "DefaultDeviceTimeoutSec = 3s";
  swapDevices =
    [{ device = "/dev/disk/by-uuid/126e2555-a716-46e1-81a1-d065f29c6084"; }];

  nixpkgs.hostPlatform = "x86_64-linux";
  hardware.cpu.intel.updateMicrocode = true;

  networking = {
    interfaces.lan.ipv4.addresses = [{
      address = "192.168.0.1";
      prefixLength = 24;
    }];
    bridges.lan.interfaces = [ "enp4s0f0" "enp4s0f1" ];
    systemd.network.networks."10-container-ve" = {
      matchConfig = {
        Kind = "veth";
        Name = "ve-*";
      };
      networkConfig = { Bridge = "lan"; };
    };

    systemd.network.networks."10-base-wan" = {
      matchConfig = { Name = "enp6s0"; };
      linkConfig = { Unmanaged = true; };
    };
    interfaces.wan = { useDHCP = true; };
    services.pppd.enable = true;
    services.pppd.peers."wan" = {
      name = "wan";
      enable = true;
      config = ''
        plugin pppoe.so

        linkname wan
        ifname wan

        enp6s0

        persist
        lcp-echo-interval 15
        lcp-echo-failure 3

        deflate 15
        predictor1
        bsdcomp 15

        noauth
        file /etc/secrets/ppp/secret.conf

        noproxyarp
        nodefaultroute

        up_sdnotify
      '';
    };
    systemd.services."pppd-wan" = {
      bindsTo = [ "sys-subsystem-net-devices-enp6s0.device" ];
      after = [ "sys-subsystem-net-devices-enp6s0.device" ];
      serviceConfig = { Type = "notify"; };
      preStart = "${pkgs.iproute2}/bin/ip link set enp6s0 up";
      postStart = "${pkgs.systemd}/bin/networkctl reconfigure wan";
    };
    networking.nftables.tables."pppoe" = {
      name = "pppoe";
      family = "inet";
      content = ''
        chain pppoe_mtu_fix {
            type filter hook forward priority mangle; policy accept;
            iifname { "wan" } tcp flags syn tcp option maxseg size set rt mtu
            oifname { "wan" } tcp flags syn tcp option maxseg size set rt mtu
        }
      '';
    };

    nat = {
      enable = true;
      internalInterfaces = [ "lan" ];
      externalInterface = "wan";
    };

    firewall = {
      trustedInterfaces = [ "lan" ];
      rejectPackets = true;
      filterForward = true;
      interfaces.wan.allowedUDPPorts = [ 68 546 ];
    };
  };
}
