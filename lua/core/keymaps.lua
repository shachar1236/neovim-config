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

-- Pin/unpin buffer
vim.keymap.set('n', '<leader>bp', '<Cmd>BufferPin<CR>', { noremap=true, desc = "Pin buffer" })
-- Close buffer
vim.keymap.set('n', '<leader>bc', '<Cmd>BufferClose<CR>', { noremap=true, desc = "Close buffer" })
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

vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")

vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], { desc = "Replace word" })
--
-- comment
vim.keymap.set("n", "<leader>/", "<cmd>CommentToggle<CR>", { desc = "Comment" })
vim.keymap.set("v", "<leader>/", "<cmd>'<,'>CommentToggle<CR>", { desc = "Comment" })
vim.keymap.set("x", "<leader>/", "<cmd>'<,'>CommentToggle<CR>", { desc = "Comment" })
