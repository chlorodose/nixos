{ ... }: {
  programs.nixvim = {
    enable = true;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;
    withNodeJs = true;
    withRuby = false;
    nixpkgs.useGlobalPackages = true;
    colorscheme = "catppuccin-mocha";
    opts = {
      termguicolors = true;
      signcolumn = "yes";
      colorcolumn = "80";
      softtabstop = 4;
      expandtab = true;
      autoindent = true;
      smartindent = true;
      shiftwidth = 4;
      shiftround = true;
      number = true;
      relativenumber = true;
    };
  };
}