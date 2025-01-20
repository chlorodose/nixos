{ pkgs, ... }: {
  i18n.inputMethod = {
    enabled = "fcitx5";
    fcitx5.addons = with pkgs; [
      fcitx5-gtk
      fcitx5-chinese-addons
    ];
  };
  xdg.configFile = {
    "fcitx5/profile".text = ''
      [Groups/0]
      Name=Default
      Default Layout=us
      DefaultIM=keyboard-us

      [Groups/0/Items/0]
      Name=keyboard-us
      Layout=

      [Groups/0/Items/1]
      Name=pinyin
      Layout=

      [GroupOrder]
      0=Default
    '';
    "fcitx5/config".text = ''
      [Hotkey]
      EnumerateWithTriggerKeys=True

      [Hotkey/TriggerKeys]
      0=Shift+Shift_L
      1=Shift+Shift_R

      [Hotkey/PrevPage]
      0=Up

      [Hotkey/NextPage]
      0=Down
    '';
    "fcitx5/conf/cloudpinyin.conf".text = ''
      MinimumPinyinLength=3
      Backend=GoogleCN
    '';
  };
}
