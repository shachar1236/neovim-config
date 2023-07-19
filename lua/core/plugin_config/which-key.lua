local wk = require("which-key")

wk.register({
    ["<leader>f"] = {
        name = "telescope",
    },
    ["<leader>b"] = {
        name = "buffers",
    },
    ["<leader>l"] = {
        name = "lsp",
    },
    ["<leader>s"] = {
        name = "splits",
    },
    ["<leader>lr"] = {
        name = "symbol",
    },
}, opts)
