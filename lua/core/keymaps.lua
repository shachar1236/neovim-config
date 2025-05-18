-- set leader
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- esc
vim.keymap.set('i', 'ww', "<esc>")

-- Navigate vim panes better
vim.keymap.set('n', '<c-k>', ':wincmd k<CR>', { desc  = "Move to the right pane" })
vim.keymap.set('n', '<c-j>', ':wincmd j<CR>',  { desc  = "Move to the pane above"  })
vim.keymap.set('n', '<c-h>', ':wincmd h<CR>', { desc  = "Move to the left pane"  })
vim.keymap.set('n', '<c-l>', ':wincmd l<CR>', { desc  = "Move to the pane below"  })

-- other keymaps
vim.keymap.set('n', '<esc>', ':nohlsearch<CR>', { desc  = "Clear search" })
 
-- nvim tree
vim.keymap.set('n', '<leader>e', ':NvimTreeFindFileToggle<CR>', { desc = "Toggle nvim-tree"})

-- barbar
vim.keymap.set('n', '<S-h>', '<Cmd>BufferPrevious<CR>', { noremap=true, desc = "Move left"})
vim.keymap.set('n', '<S-l>', '<Cmd>BufferNext<CR>', { noremap=true, desc = "Move left"})

vim.keymap.set('n', '<A-l>', '<Cmd>BufferMoveNext<CR>', { noremap=true, desc = "Move buffer right"})
vim.keymap.set('n', '<A-h>', '<Cmd>BufferMovePrevious<CR>', { noremap=true, desc = "Move buffer left"})

-- New buffer
vim.keymap.set('n', '<leader>bn', '<Cmd>enew<CR>', { noremap = true, desc = "New buffer" })
-- Pin/unpin buffer
vim.keymap.set('n', '<leader>bp', '<Cmd>BufferPin<CR>', { noremap=true, desc = "Pin buffer" })
-- Close buffer
vim.keymap.set('n', '<leader>bc', '<Cmd>bd<CR>', { noremap = true, desc = "Close buffer" })

-- splits
vim.keymap.set('n', '<leader>|', '<Cmd>vs<CR>', { noremap = true, desc = "Vertical split" })
vim.keymap.set('n', '<leader>_', '<Cmd>split<CR>', { noremap = true, desc = "Horizontal split" })

vim.keymap.set('n', '<leader>sv', '<Cmd>vs<CR>', { noremap = true, desc = "Vertical split" })
vim.keymap.set('n', '<leader>sh', '<Cmd>split<CR>', { noremap = true, desc = "Horizontal split" })

function Adjust_width(change)
    local current_width = vim.api.nvim_win_get_width(0)
    vim.api.nvim_win_set_width(0, current_width + change)
end

-- Function to adjust split height
function Adjust_height(change)
    local current_height = vim.api.nvim_win_get_height(0)
    vim.api.nvim_win_set_height(0, current_height + change)
end

-- Function to equalize split sizes
function Equalize_splits()
    vim.api.nvim_exec('wincmd =', true)
end

vim.keymap.set('n', '<leader>s+', '<Cmd>lua Adjust_height(1)<CR>', { noremap = true, desc = "Increase split height" })
vim.keymap.set('n', '<leader>s-', '<Cmd>lua Adjust_height(-1)<CR>', { noremap = true, desc = "Decrease split height" })
vim.keymap.set('n', '<leader>s>', '<Cmd>lua Adjust_width(1)<CR>', { noremap = true, desc = "Increase split width" })
vim.keymap.set('n', '<leader>s<', '<Cmd>lua Adjust_width(-1)<CR>', { noremap = true, desc = "Decrease split width" })
vim.keymap.set('n', '<leader>s=', '<Cmd>lua Equalize_splits()<CR>', { noremap = true, desc = "Equalize split" })
vim.keymap.set('n', '<leader>s_', '<C-w>_', { noremap = true, desc = "Max split height" })
vim.keymap.set('n', '<leader>s|', '<C-w>|', { noremap = true, desc = "Max split width" })

-- terminal
vim.keymap.set('n', '<leader>t', '<Cmd>split<CR><Cmd>terminal<CR>G', { noremap = true, desc = "Open terminal" })
vim.keymap.set('t', '<Esc>', '<C-\\><C-n>', { noremap = true, desc = "Normal mode" })

-- close neovim
vim.keymap.set('n', '<leader>q', '<Cmd>qa<CR>', { noremap = true, desc = "Quit neovim" })
-- git
vim.keymap.set("n", "<leader>gs", vim.cmd.Git, { desc = "Git status" })
vim.keymap.set("n", "<leader>gp", ":Git push<CR>", { desc = "Git push" })
vim.keymap.set("n", "<leader>gP", ":Git pull<CR>", { desc = "Git pull" })
vim.keymap.set("n", "<leader>gc", ":Git commit<CR>", { desc = "Git commit" })
vim.keymap.set("n", "<leader>gaa", ":Git add *<CR>", { desc = "Git add all" })
--
--
--
--
--
--
-- the primegen remaps
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- greatest remap ever
vim.keymap.set("x", "<leader>p", [["_dP]], { desc = "Patse without copying" })

vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]], { desc = "Delete without copying" })

vim.keymap.set("n", "<leader>us", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], { desc = "Replace word" })
--
-- comment
vim.keymap.set("n", "<leader>/", "<cmd>CommentToggle<CR>", { desc = "Comment" })
vim.keymap.set("v", "<leader>/", "<cmd>'<,'>CommentToggle<CR>", { desc = "Comment" })
vim.keymap.set("x", "<leader>/", "<cmd>'<,'>CommentToggle<CR>", { desc = "Comment" })

-- lsp
vim.keymap.set("n", "<leader>lf", function() vim.lsp.buf.format({ async = true }) end, { desc = "Format" })
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
