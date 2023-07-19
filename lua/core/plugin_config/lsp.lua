local lsp = require("lsp-zero")

lsp.preset("recommended")

lsp.ensure_installed({
  'gopls',
  'pyright',
})

-- Fix Undefined global 'vim'
lsp.nvim_workspace()

-- mappings
local cmp = require('cmp')

local cmp_mappings = lsp.defaults.cmp_mappings({
    -- `Enter` key to confirm completion
    ['<CR>'] = cmp.mapping.confirm({select = false}),

    -- Ctrl+Space to trigger completion menu
    ['<C-Space>'] = cmp.mapping.complete(),
    -- prefer codium over lsp completion
    ['<Tab>'] = cmp.mapping.select_next_item(),
})

lsp.setup_nvim_cmp({
  mapping = cmp_mappings
})

lsp.set_preferences({
    suggest_lsp_servers = false,
    sign_icons = {
        error = 'E',
        warn = 'W',
        hint = 'H',
        info = 'I'
    }
})

lsp.on_attach(function(client, bufnr)
  vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, { buffer = bufnr, remap = false, desc = "Go to definition" })
  vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, { buffer = bufnr, remap = false, desc = "Hover" })
  vim.keymap.set("n", "<leader>ls", function() vim.lsp.buf.workspace_symbol() end, { buffer = bufnr, remap = false, desc="Find symbol" })
  vim.keymap.set("n", "<leader>ld", function() vim.diagnostic.open_float() end, { buffer = bufnr, remap = false, desc="Diagnose line" })
  vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, { buffer = bufnr, remap = false, desc="Next diagnosed line" })
  vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, { buffer = bufnr, remap = false, desc="Previous diagnosed line" })
  vim.keymap.set("n", "<leader>la", function() vim.lsp.buf.code_action() end, { buffer = bufnr, remap = false, desc="Code action" })
  vim.keymap.set("n", "<leader>lrr", function() vim.lsp.buf.references() end, { buffer = bufnr, remap = false, desc="Find references" })
  vim.keymap.set("n", "<leader>lrn", function() vim.lsp.buf.rename() end, { buffer = bufnr, remap = false, desc="Rename symbol" })
  vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, { buffer = bufnr, remap = false, desc="Signature help" })

  -- formatting
  local lsp_format_modifications = require"lsp-format-modifications"
    lsp_format_modifications.attach(client, bufnr, { format_on_save = true })
end)

lsp.setup()

vim.diagnostic.config({
    virtual_text = true
})
