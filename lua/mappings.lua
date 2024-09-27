require "nvchad.mappings"
local bufnr = vim.api.nvim_get_current_buf()
-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
-- -- place this in one of your configuration file(s)
local hop = require("hop").setup()

-- normal mode (sneak-like)
map("n", "<Leader>s", "<cmd>HopChar2AC<CR>", { noremap = false })
map("n", "<Leader>S", "<cmd>HopChar2BC<CR>", { noremap = false })

-- visual mode (sneak-like)
map("v", "s", "<cmd>HopChar2AC<CR>", { noremap = false })
map("v", "S", "<cmd>HopChar2BC<CR>", { noremap = false })

map("n", "<leader>a", function()
  vim.cmd.RustLsp "codeAction" -- supports rust-analyzer's grouping
  -- or vim.lsp.buf.codeAction() if you don't want grouping.
end, { silent = true, buffer = bufnr })
map("n", "C-a", function()
  vim.cmd.RustLsp { "hover", "actions" }
  -- or vim.lsp.buf.codeAction() if you don't want grouping.
end, { silent = true, buffer = bufnr })
map({ "n", "t" }, "<C-h>", function()
  require("nvchad.term").toggle { pos = "sp", id = "htoggleTerm" }
end, { desc = "terminal toggleable horizontal term" })
-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
