if !exists('g:loaded_telescope') | finish | endif

nnoremap <silent> <localleader>fb <cmd>lua require('telescope.builtin').file_browser()<cr>
nnoremap <silent> <localleader>ff <cmd>lua require('telescope.builtin').find_files()<cr>
nnoremap <silent> <localleader>jl <cmd>lua require('telescope.builtin').jumplist()<cr>
nnoremap <silent> <localleader>lg <cmd>lua require('telescope.builtin').live_grep()<cr>
nnoremap <silent> <localleader>ll <cmd>lua require('telescope.builtin').loclist()<cr>
nnoremap <silent> <localleader>of <cmd>lua require('telescope.builtin').oldfiles()<cr>
nnoremap <silent> <localleader>sh <cmd>lua require('telescope.builtin').search_history()<cr>
nnoremap <silent> <localleader>qf <cmd>lua require('telescope.builtin').quickfix()<cr>
nnoremap <silent> <localleader>\ <cmd>Telescope buffers<cr>
nnoremap <silent> <localleader>; <cmd>Telescope help_tags<cr>

lua << EOF
function telescope_buffer_dir()
    return vim.fn.expand('%:p:h')
end

local telescope = require('telescope')
local actions = require('telescope.actions')

telescope.setup{
defaults = {
    mappings = {
        n = {
            ["q"] = actions.close
            },
        },
    }
}
EOF


