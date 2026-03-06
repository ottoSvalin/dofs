vim.o.number = true
vim.o.relativenumber = true
vim.o.signcolumn = "yes"
vim.o.winborder = "rounded"
vim.o.cursorline = true

vim.o.tabstop = 2
vim.o.softtabstop = 2
vim.o.shiftwidth = 2
vim.o.expandtab = true
vim.o.autoindent = true
vim.o.smartindent = true
vim.g.mapleader = " "
vim.keymap.set("n", "j", "gj", { remap = true, silent = true })
vim.keymap.set("n", "k", "gk", { remap = true, silent = true })
vim.api.nvim_create_autocmd("BufWritePost", {
  pattern = "*.tex",
  command = ":!pdflatex main.tex"
})


vim.o.swapfile = false

vim.pack.add({
  { src = "https://github.com/neovim/nvim-lspconfig" },
  { src = "https://github.com/stevearc/oil.nvim" },
  { src = "https://github.com/echasnovski/mini.pick" },
  { src = "https://github.com/ellisonleao/gruvbox.nvim" },
})

require "mini.pick".setup()
require "oil".setup()

vim.keymap.set('n', '<leader>f', ":Pick files<CR>")
vim.keymap.set('n', '<leader>h', ":Pick help<CR>")
vim.keymap.set('n', '<leader>e', ":Oil<CR>")

vim.lsp.enable({ "lua_ls", "rust_analyzer", "texlab" })
vim.keymap.set('n', '<leader>lf', vim.lsp.buf.format)

vim.api.nvim_create_autocmd('LspAttach', {
  callback = function(ev)
    local client = vim.lsp.get_client_by_id(ev.data.client_id)
    if client:supports_method('textDocument/completion') then
      vim.lsp.completion.enable(true, client.id, ev.buf, { autotrigger = true })
    end
  end,
})
vim.cmd("set completeopt+=noselect")

vim.cmd([[colorscheme gruvbox]])
