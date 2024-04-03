--{} Keymap{}s are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lu
local keymap = vim.keymap
local wk = require("which-key")
local opts = { noremap = true, silent = true }

-- General
keymap.set("n", "<C-+>", "<cmd>resize +2<cr>", { desc = "Increase window height" })
keymap.set("n", "<C-0>", "<cmd>resize -2<cr>", { desc = "Decrease window height" })
keymap.set("n", "<C-?>", "<cmd>resize +2<cr>", { desc = "Increase window height" })
keymap.set("n", "<C-=>", "<cmd>resize -2<cr>", { desc = "Decrease window height" })
--

local builtin = require("telescope.builtin")
local mark = require("harpoon.mark")
local ui = require("harpoon.ui")

-- which-key
wk.register({
  ["<leader>p"] = {
    name = "+custom search",
  },
  ["<leader>ø"] = {
    name = "+harpoon register",
  },
})

-- custom search
keymap.set("n", "<leader>pv", vim.cmd.Ex, { desc = "Exit to file menu" })

keymap.set("n", "<leader>ps", function()
  builtin.grep_string({ search = vim.fn.input("Grep > ") })
end, { desc = "Fuzzy grep search" })

keymap.set("n", "<leader>pf", builtin.find_files, { desc = "Fuzzy find file" })

-- harpoon
keymap.set("n", "<leader>a", mark.add_file, { desc = "Harpoon: Add file" })
keymap.set("n", "<C-a>", ui.toggle_quick_menu, { desc = "Harppon: Toggle menu" })

keymap.set("n", "<leader>ø1", function()
  ui.nav_file(1)
end, { desc = "Harpoon: Goto file 1" })

keymap.set("n", "<leader>ø2", function()
  ui.nav_file(2)
end, { desc = "Harpoon: Goto file 2" })

keymap.set("n", "<leader>ø3", function()
  ui.nav_file(3)
end, { desc = "Harpoon: Goto file 3" })

keymap.set("n", "<leader>ø4", function()
  ui.nav_file(4)
end, { desc = "Harpoon: Goto file 3" })

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

-- Git
keymap.set("n", "<leader>gi", vim.cmd.Git)

-- File management
keymap.set("n", "<leader>xe", "<cmd>!chmod +x %<CR>", { desc = "Make exectable" })

-- Increment/decrement
-- keymap.set("n", "+", "<C-a>")
-- keymap.set("n", "-", "<C-x>")

-- Tabs
keymap.set("n", "<leader><tab>e", ":tabedit", { desc = "tab edit" })
keymap.set("n", "<leader><tab>n", ":tabnext<Return>", { desc = "nest tab" })
keymap.set("n", "<leader><tab>p", ":tabprev<Return>", { desc = "previous tab" })

-- Codeium
keymap.set("i", "<C-g>", function()
  return vim.fn["codeium#Accept"]()
end, { expr = true, silent = true })

keymap.set("i", "<C-f>", function()
  return vim.fn["codeium#CycleCompletions"](1)
end, { expr = true, silent = true })

keymap.set("i", "<C-d>", function()
  return vim.fn["codeium#CycleCompletions"](-1)
end, { expr = true, silent = true })

keymap.set("i", "<C-x>", function()
  return vim.fn["codeium#Clear"]()
end, { expr = true, silent = true })

keymap.set("i", "<C-c>", function()
  return vim.fn["codeium#Chat"]()
end, { expr = true, silent = true })

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
  --[[ snippet = {
    expand = function(args)
      require("lunasnip").lsp_expand(args.body)
    end,
  }, ]]
})
