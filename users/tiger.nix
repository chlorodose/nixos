{ config, lib, pkgs, ... }: {
  users.users.tiger = {
    isNormalUser = true;
    home = "/home/tiger";
    createHome = true;
    extraGroups = [];
    initialHashedPassword = "$y$j9T$MTN8ygTcjbnDPtX4hpHFr1$C5k3.Am1sstmemPD8W4bqlz1/5VNWIkYMQAs4wgimv.";
  };
}