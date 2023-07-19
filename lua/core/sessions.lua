-- Enable persistent undo
vim.cmd('set undofile')

-- Define the path where session files will be stored
local session_dir = vim.fn.stdpath('data') .. '/sessions'
local current_dir = vim.fn.expand('%:p:h')
local current_dir_bare = current_dir:gsub("/", "")
current_dir_bare = current_dir_bare:gsub("\\", "")

-- Automatically create the session directory if it doesn't exist
vim.fn.mkdir(session_dir, 'p')

-- Set the session options
vim.o.sessionoptions = table.concat({
    'buffers', 'curdir', 'tabpages', 'winsize', 'resize', 'winpos'
}, ',')

-- Function to save the current session
function Save_session()
    -- makes new buffer so it doesn't mess up the current buffer
    vim.cmd('enew')
    -- save session
    local session_file = session_dir .. current_dir_bare
    vim.cmd('mksession! ' .. session_file)
end

-- Function to restore the session
function Restore_session()
    -- remove new buffer so it doesn't mess up the current buffer
    vim.defer_fn(function()
        vim.cmd('bd')
    end, 0)
    -- restore session
    local session_file = session_dir .. current_dir_bare
    if vim.fn.filereadable(session_file) ~= 0 then
        vim.cmd('source ' .. session_file)
    end
end

-- Automatically save the session when Vim is exited
vim.cmd('autocmd VimLeavePre * lua Save_session()')

-- Automatically restore the session and source the regular config when Vim is started
vim.cmd('autocmd VimEnter * lua Restore_session()')
