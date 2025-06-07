vim.g.mapleader = " "
local keymap = vim.keymap

-- tab creation and traversal
keymap.set("n", "<leader>th", "<cmd>tabp<CR>", { desc = "Go to the tab on the left of the current tab" })
keymap.set("n", "<leader>tl", "<cmd>tabn<CR>", { desc = "Go to the tab on the right of the current tab" })
keymap.set("n", "<leader>tn", ":Texplore<CR>", { desc = "Make a new tab" })
keymap.set("n", "<leader>tc", "<cmd>tabclose<CR>", { desc = "Close current tab" })

-- split creation and traversal
keymap.set("n", "<leader>wh", "<C-w>h", { desc = "Go to the tab on the left of the current tab" })
keymap.set("n", "<leader>wl", "<C-w>l", { desc = "Go to the tab on the right of the current tab" })
keymap.set("n", "<leader>wn", "<cmd>vnew<CR>", { desc = "Make a new tab" })

-- misc
keymap.set("n", "<leader>cs", ":nohl<CR>", { desc = "Clear Search Highlights" })

-- commenting lines
vim.api.nvim_set_keymap('n', '<C-/>', 'gcc', { noremap = false, silent = false }) -- Toggle comment for current line
vim.api.nvim_set_keymap('v', '<C-/>', "gc", { noremap = false, silent = false })  -- Toggle comment for selected lines

-- which key
keymap.set("n", "<leader>ww", "<cmd>WhichKey<cr>", { desc = "Show available keymaps" })

-- git stuff
keymap.set("n", "<leader>gp", "<cmd>:Gitsigns preview_hunk_inline<cr>", { desc = "Show available keymaps" })
keymap.set("n", "<leader>grr", "<cmd>:Gitsigns reset_hunk<cr>", { desc = "Show available keymaps" })
keymap.set("n", "<leader>gt", "<cmd>:Gitsigns toggle_current_line_blame<cr>", { desc = "Show available keymaps" })

-- telescopy
keymap.set("n", "<leader>f", "<cmd>Telescope find_files<cr>", { desc = "Fuzzy find files in cwd" })
keymap.set("n", "<leader>tr", "<cmd>Telescope oldfiles<cr>", { desc = "Fuzzy find recent files" })
keymap.set("n", "<leader>ts", "<cmd>Telescope live_grep<cr>", { desc = "Find string in cwd" })
keymap.set("n", "<leader>tf", "<cmd>Telescope grep_string<cr>", { desc = "Find string under cursor in cwd" })

-- files
keymap.set("n", "<leader>ee", ":Ex<CR>", { desc = "Switch to NetRW" })

-- LSP
keymap.set("n", "<leader>lf", function() vim.lsp.buf.definition() end, { desc = "LSP definition" })
keymap.set("n", "<leader>lh", function() vim.lsp.buf.hover({ border = "double" }) end, { desc = "LSP hover" })
keymap.set("n", "<leader>lws", function() vim.lsp.buf.workspace_symbol() end, { desc = "LSP workspace symbol" })
keymap.set("n", "<leader>lof", function() vim.diagnostic.open_float() end, { desc = "LSP open float" })
keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, { desc = "LSP goto next" })
keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, { desc = "LSP goto previous" })
keymap.set("n", "<leader>.", function() vim.lsp.buf.code_action() end, { desc = "Show LSP powered code actions" })
keymap.set("n", "<leader>lr", function() vim.lsp.buf.references() end, {})
keymap.set("n", "<leader>ln", function() vim.lsp.buf.rename() end, { desc = "Rename" })
keymap.set("n", "<leader>ii", function() vim.lsp.buf.format({ async = false }) end, { desc = "Format using LSP" })
keymap.set("n", "<leader>ll", function() vim.lsp.buf.signature_help({ border = "double" }) end,
  { desc = "Signature Help" })
keymap.set("n", "<leader>er", function() vim.diagnostic.open_float({ border = "double" }) end,
  { desc = "Show the error message" })

-- flutter bloc
keymap.set("n", "<leader>cfb", function() require("flutter-bloc").create_bloc() end,
  { desc = '[C]reate [F]lutter [B]loc' })
keymap.set("n", "<leader>cfc", function() require("flutter-bloc").create_cubit() end,
  { desc = '[C]reate [F]lutter [C]ubit' })

-- csv
keymap.set("n", "<leader>cv", "<cmd>CsvViewToggle delimiter=, quote_char=' comment=# display_mode=border <CR>",
  { desc = 'Toggle csv view' })
