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

local function DoesNeedRestore()
    if #vim.api.nvim_list_uis() > 0 then
        -- Check if Neovim UI is running (not headless)
        if #vim.v.argv > 1 then
            -- Check if command-line arguments are present
            -- Perform actions based on the arguments
            return false
        else
            return true
        end
    else
        return true
    end
end
-- Function to save the current session
function Save_session()
    -- save session
    local session_file = session_dir .. current_dir_bare
    vim.cmd('mksession! ' .. session_file)
end

-- Function to restore the session
function Restore_session()
    if DoesNeedRestore() then
        vim.defer_fn(function()
            vim.cmd('filetype detect')
        end, 0)
        -- restore session
        local session_file = session_dir .. current_dir_bare
        if vim.fn.filereadable(session_file) ~= 0 then
            vim.cmd('source ' .. session_file)
        end
    end
end

-- Automatically save the session when Vim is exited
vim.cmd('autocmd VimLeavePre * lua Save_session()')

-- Automatically restore the session and source the regular config when Vim is started
vim.cmd('autocmd VimEnter * lua Restore_session()')


