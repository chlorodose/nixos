local L = require("lspconfig")
L.nixd.setup({})
L.lua_ls.setup({})
require("blink.cmp").setup({
    keymap = { preset = "default" },
    sources = {
      default = { 'lsp', 'path', 'snippets', 'buffer' },
    },
})