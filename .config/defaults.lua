vim.oguicursor = ""
vim.o.nu = true
vim.o.relativenumber = true
vim.o.tabstop = 2
vim.o.softtabstop = 2
vim.o.shiftwidth = 2
vim.o.expandtab = true
vim.o.smartindent = true
vim.o.wrap = false
vim.o.swapfile = false
vim.o.backup = false
vim.o.undodir = os.getenv("XDG_CONFIG_HOME") .. "/nvm/undodir"
vim.o.undofile = true
vim.o.hlsearch = false
vim.o.incsearch = true
vim.o.termguicolors = true
vim.o.scrolloff = 8
vim.o.signcolumn = "yes"
vim.o.updatetime = 50
vim.o.colorcolumn = "80"
vim.o.autochdir = true
vim.o.cursorline = true

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")
vim.keymap.set({ "n", "v" }, "<BS>", [["_d]])
vim.keymap.set("n", "<F2>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<S-F2>", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "<leader>m", "", { desc = '[m]ove' })
vim.keymap.set("n", "<leader>mn", "<cmd>lnext<CR>zz", { desc = '[m]ove [n]ext location' })
vim.keymap.set("n", "<leader>mp", "<cmd>lprev<CR>zz", { desc = '[m]ove [p]revious location' })

vim.g.loaded_ruby_provider = 0
