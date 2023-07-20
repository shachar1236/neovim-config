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
    ["<leader>g"] = {
        name = "git",
    },
    ["<leader>ga"] = {
        name = "add",
    },
    ["<leader>lr"] = {
        name = "symbol",
    },
}, opts)
