--{} Keymap{}s are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lu
local keymap = vim.keymap
local opts = { noremap = true, silent = true }

-- General
keymap.set("n", "<C-+>", "<cmd>resize +2<cr>", { desc = "Increase window height" })
keymap.set("n", "<C-0>", "<cmd>resize -2<cr>", { desc = "Decrease window height" })
keymap.set("n", "<C-?>", "<cmd>resize +2<cr>", { desc = "Increase window height" })
keymap.set("n", "<C-=>", "<cmd>resize -2<cr>", { desc = "Decrease window height" })
--

vim.g.mapleader = " "
keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- Move lines
keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "Shift selected lines down", silent = true })
keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "Shift selected lines up", silent = true })
keymap.set("n", "J", "mzJ`z", { desc = "Keep curor in place when joining lines" })

-- Keep cursor centered
keymap.set("n", "<C-u>", "<C-u>zz", { desc = "Keeps cursor in place during half page up" })
keymap.set("n", "<C-d>", "<C-d>zz", { desc = "Keeps cursor in place during half page down" })
keymap.set("n", "n", "nzzzv", { desc = "Keeps cursor in place during next find" })
keymap.set("n", "N", "Nzzzv", { desc = "Keeps cursor in place during previous find" })

-- Copy / Paste
keymap.set("n", "Y", "yg$", { desc = "Yank to end of line" })
keymap.set("x", "<leader>p", [["_dP]], { desc = "Keep the register intact when pasting" })
keymap.set({ "n", "v" }, "<leader>y", [["+y]], { desc = "Copy to system clip board" })
keymap.set("n", "<leader>Y", [["+Y]], { desc = "Copy until EOL to system clip board" })

-- Find / Replace
keymap.set("n", "<leader>r", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], { desc = "Find/replace all" })

-- File management
keymap.set("n", "<leader>xe", "<cmd>!chmod +x %<CR>", { desc = "Make exectable" })

-- Increment/decrement
-- keymap.set("n", "+", "<C-a>")
-- keymap.set("n", "-", "<C-x>")

-- Tabs
keymap.set("n", "<leader><tab>e", ":tabedit", { desc = "tab edit" })
keymap.set("n", "<leader><tab>n", ":tabnext<Return>", { desc = "nest tab" })
keymap.set("n", "<leader><tab>p", ":tabprev<Return>", { desc = "previous tab" })

-- nvim-cmp bindings
local cmp = require("cmp")
local cmp_select = { behavior = cmp.SelectBehavior.Select }

cmp.setup({
  sources = {
    { name = "path" },
    { name = "nvim_lsp" },
    { name = "nvim_lua" },
    { name = "luasnip", keyword_length = 2 },
    { name = "buffer", keyword_length = 3 },
  },
  -- auto complete
  mapping = cmp.mapping.preset.insert({
    ["<C-k>"] = cmp.mapping.select_prev_item(cmp_select),
    ["<C-j>"] = cmp.mapping.select_next_item(cmp_select),
    ["<C-l>"] = cmp.mapping.confirm({ select = true }),
    ["<C-Space>"] = cmp.mapping.complete(),
  }),
  window = {
    completion = cmp.config.window.bordered(),
    documentation = cmp.config.window.bordered(),
  },
  -- snippets
  snippet = {
    expand = function(args)
      require("lunasnip").lsp_expand(args.body)
    end,
  },
})
