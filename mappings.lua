---@type MappingsTable
local M = {}

M.myMappings = {
  n = {
    ["<space>"] = { ":", "enter command mode", opts = { nowait = true } },
    ["o"] = { "o<esc>", "open a new line below" },
    ["O"] = { "O<esc>", "open a new line above" },
    ["n"] = { "nzz", "center cursor vertically during search" },
    ["N"] = { "Nzz", "center cursor vertically during search (reverse)" },
    ["J"] = { "mzJ`z", "Join line with line below" },
    ["<C-d>"] = { "<C-d>zz", "Scroll screen down and center cursor" },
    ["<C-u>"] = { "<C-u>zz", "Scroll screen up and center cursor" },
    ["<C-A-d>"] = { [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], "Search and replace" },
  },
}

M.general = {
  i = {
    -- ["<c-c>"] = { '"+y', " ", opts = { nowait = true } },
    -- ["<c-v>"] = { "<c-r>+", " ", opts = { nowait = true } },
    ["<M-Up>"] = { "<cmd>m-2<cr>", " ", opts = { nowait = true } },
    ["<M-Down>"] = { "<cmd>m+<cr>", " ", opts = { nowait = true } },
    ["<S-Down>"] = { "<cmd>t.<cr>", " ", opts = { nowait = true } },
    ["<S-Up>"] = { "<cmd>t -1<cr>", " ", opts = { nowait = true } },
    ["<C-s>"] = { "<cmd>w<cr>", " ", opts = { nowait = true } },
    ["<C-l>"] = { "<cmd>LiveServer start<cr><cr>", " ", opts = { nowait = true } },
    ["<C-f>"] = { "<cmd>lua vim.lsp.buf.format{async=true}<cr>", " ", opts = { nowait = true } },
  },
  v = {
    ["<A-j>"] = { ":m .+1<CR>==", " ", opts = { nowait = true } },
    ["<A-k>"] = { ":m .-2<CR>==", " ", opts = { nowait = true } },
    ["p"] = { '"_dP', " ", opts = { nowait = true } },
    ["<c-c>"] = { '"+y', " ", opts = { nowait = true } },
    ["<c-v>"] = { '"+p', " ", opts = { nowait = true } },
    ["J"] = { ":move '>+1<CR>gv-gv", " ", opts = { nowait = true } },
    ["K"] = { ":move '<-2<CR>gv-gv", " ", opts = { nowait = true } },
    -- ["<A-j>"] = { ":move '>+1<CR>gv-gv", " ", opts = { nowait = true } },
    ["<A-Down>"] = { ":move '>+1<CR>gv-gv", " ", opts = { nowait = true } },
    -- ["<A-k>"] = { ":move '<-2<CR>gv-gv", " ", opts = { nowait = true } },
    ["<A-Up>"] = { ":move '<-2<CR>gv-gv", " ", opts = { nowait = true } },
    ["<S-Down>"] = { ":'<,'>t'><cr>", " ", opts = { nowait = true } },
  },
  n = {
    -- second key is the lefthand side of the map
    -- mappings seen under group name "Buffer"
    ["<c-c>"] = { '"+y', " ", opts = { nowait = true } },
    ["<c-v>"] = { '"+p', " ", opts = { nowait = true } },
    ["<S-Down>"] = { "<cmd>t.<cr>", " ", opts = { nowait = true } },
    ["<S-Up>"] = { "<cmd>t -1<cr>", " ", opts = { nowait = true } },
    ["<M-J>"] = { "<cmd>t.<cr>", " ", opts = { nowait = true } },
    ["<M-K>"] = { "<cmd>t -1<cr>", " ", opts = { nowait = true } },
    ["<M-Down>"] = { "<cmd>m+<cr>", " ", opts = { nowait = true } },
    ["<M-Up>"] = { "<cmd>m-2<cr>", " ", opts = { nowait = true } },
    ["<M-j>"] = { "<cmd>m+<cr>", " ", opts = { nowait = true } },
    ["<M-k>"] = { "<cmd>m-2<cr>", " ", opts = { nowait = true } },
    ["<C-f>"] = { "<cmd>lua vim.lsp.buf.format{async=true}<cr>", " ", opts = { nowait = true } },
    -- ["q"] = { "<cmd>q<cr>", " ", opts = { nowait = true } },
    -- ["<leader>bb"] = { "<cmd>tabnew<cr>", " ", opts = { nowait = true } },
    -- ["<leader>bc"] = { "<cmd>BufferLinePickClose<cr>", " ", opts = { nowait = true } },
    -- ["<leader>bj"] = { "<cmd>BufferLinePick<cr>", " ", opts = { nowait = true } },
    -- ["<leader>bt"] = { "<cmd>BufferLineSortByTabs<cr>", " ", opts = { nowait = true } },
    -- quick save
    -- ["<C-s>"] = { ":w!<cr>", desc = "Save File" },  -- change description but the same command
  },
}
-- custom which key disini
M.whichkey = {
  n = {
    ["<leader>o"] = { "<cmd> NvimTreeFocus <CR>", "Focus Sidebar" },
    -- ["<leader>r"] = { name = "+Run" },
  },
}

M.sneakMappings = {
  n = {
    ["f"] = { "<Plug>Sneak_f", "Use Sneak forward" },
    ["F"] = { "<Plug>Sneak_F", "Use Sneak backward" },
    ["t"] = { "<Plug>Sneak_t", "Use Sneak till forward" },
    ["T"] = { "<Plug>Sneak_T", "Use Sneak till backward" },
  },
}

M.zenMode = {
  n = {
    ["<leader>zz"] = { "<cmd>ZenMode <CR>", "Toggle Zen Mode" },
  },
}

return M
