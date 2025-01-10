{ config, lib, pkgs, ... }: {
  # systemd.nspawn."openwrt" = {
  #   execConfig = {
  #     Boot = true;
  #     Hostname = "openwrt";
  #     LinkJournal = "try-guest";
  #     PrivateUsers = "pick";
  #     ResolvConf = "off";
  #     Timezone = "copy";
  #     KillSignal = "SIGTERM";
  #   };
  #   filesConfig = {
  #     PrivateUsersChown = true;
  #   };
  #   networkConfig = {
  #     Private = true;
  #     VirtualEthernetExtra= "ve-openwrt:br-lan";
  #   };
  # };
}