local wk = require("which-key")

wk.register({
    ["<leader>f"] = {
        name = "telescope",
    },
    ["<leader>b"] = {
        name = "buffers",
    }
}, opts)
