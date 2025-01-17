{ config, lib, pkgs, ... }: {
  programs.neovim = {
    enable = true;
    defaultEditor = true;
    withPython3 = true;
    withNodeJs = true;
    plugins = with pkgs.vimPlugins; [
      catppuccin-nvim
      nvim-lspconfig
      which-key-nvim
      neo-tree-nvim
      blink-cmp
      nvim-web-devicons
      snacks-nvim
    ];
    extraPackages = with pkgs; [
      nixd
      lua-language-server
    ];
    extraLuaConfig = ''
      require("globals")
      require("lsp")
    '';
  };
  home.file.".config/nvim/lua" = {
    source = ./config;
    recursive = true;
  };
}
