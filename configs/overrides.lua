local M = {}

M.treesitter = {
  ensure_installed = {
    "vim",
    "lua",
    "html",
    "css",
    "javascript",
    "typescript",
    "tsx",
    "c",
    "markdown",
    "markdown_inline",
  },
  indent = {
    enable = true,
    --   "python"
    -- disable = {
    -- },
  },
}

M.mason = {
  ensure_installed = {
    -- lua stuff
    "lua-language-server",
    "stylua",

    -- web dev stuff
    "css-lsp",
    "html-lsp",
    "typescript-language-server",
    "deno",
    "prettier",
  },
}

-- git support in nvimtree
M.nvimtree = {
  git = {
    enable = true,
  },

  renderer = {
    highlight_git = true,
    icons = {
      show = {
        git = true,
      },
    },
  },

  on_attach = function(bufnr)
    local function opts(desc)
      return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
    end
    local ok, api = pcall(require, "nvim-tree.api")
    assert(ok, "api module is not found")

    local function edit_or_open()
      local node = api.tree.get_node_under_cursor()

      if node.nodes ~= nil then
        -- expand or collapse folder
        api.node.open.edit()
      else
        -- open file
        api.node.open.edit()
        -- Close the tree if file was opened
        api.tree.close()
      end
    end

    -- open as vsplit on current node
    local function vsplit_preview()
      local node = api.tree.get_node_under_cursor()

      if node.nodes ~= nil then
        -- expand or collapse folder
        api.node.open.edit()
      else
        -- open file as vsplit
        api.node.open.vertical()
      end

      api.tree.close()
    end
    local mappings = {
      -- BEGIN_DEFAULT_ON_ATTACH
      ["<C-]>"] = { api.tree.change_root_to_node, "CD" },
      ["<C-e>"] = { api.node.open.replace_tree_buffer, "Open: In Place" },
      ["<C-k>"] = { api.node.show_info_popup, "Info" },
      ["<C-r>"] = { api.fs.rename_sub, "Rename: Omit Filename" },
      ["<C-t>"] = { api.node.open.tab, "Open: New Tab" },
      ["<C-v>"] = { api.node.open.vertical, "Open: Vertical Split" },
      ["<C-x>"] = { api.node.open.horizontal, "Open: Horizontal Split" },
      ["<BS>"] = { api.node.navigate.parent_close, "Close Directory" },
      ["<CR>"] = { api.node.open.edit, "Open" },
      ["<Tab>"] = { api.node.open.preview, "Open Preview" },
      [">"] = { api.node.navigate.sibling.next, "Next Sibling" },
      ["<"] = { api.node.navigate.sibling.prev, "Previous Sibling" },
      ["."] = { api.node.run.cmd, "Run Command" },
      ["-"] = { api.tree.change_root_to_parent, "Up" },
      ["a"] = { api.fs.create, "Create" },
      ["bmv"] = { api.marks.bulk.move, "Move Bookmarked" },
      ["B"] = { api.tree.toggle_no_buffer_filter, "Toggle No Buffer" },
      ["c"] = { api.fs.copy.node, "Copy" },
      ["C"] = { api.tree.toggle_git_clean_filter, "Toggle Git Clean" },
      ["[c"] = { api.node.navigate.git.prev, "Prev Git" },
      ["]c"] = { api.node.navigate.git.next, "Next Git" },
      ["d"] = { api.fs.remove, "Delete" },
      ["D"] = { api.fs.trash, "Trash" },
      ["E"] = { api.tree.expand_all, "Expand All" },
      ["e"] = { api.fs.rename_basename, "Rename: Basename" },
      ["]e"] = { api.node.navigate.diagnostics.next, "Next Diagnostic" },
      ["[e"] = { api.node.navigate.diagnostics.prev, "Prev Diagnostic" },
      ["F"] = { api.live_filter.clear, "Clean Filter" },
      ["f"] = { api.live_filter.start, "Filter" },
      ["g?"] = { api.tree.toggle_help, "Help" },
      ["gy"] = { api.fs.copy.absolute_path, "Copy Absolute Path" },
      ["H"] = { api.tree.toggle_hidden_filter, "Toggle Dotfiles" },
      ["I"] = { api.tree.toggle_gitignore_filter, "Toggle Git Ignore" },
      ["J"] = { api.node.navigate.sibling.last, "Last Sibling" },
      ["K"] = { api.node.navigate.sibling.first, "First Sibling" },
      ["m"] = { api.marks.toggle, "Toggle Bookmark" },
      ["o"] = { api.node.open.edit, "Open" },
      ["O"] = { api.node.open.no_window_picker, "Open: No Window Picker" },
      ["p"] = { api.fs.paste, "Paste" },
      ["P"] = { api.node.navigate.parent, "Parent Directory" },
      ["q"] = { api.tree.close, "Close" },
      ["r"] = { api.fs.rename, "Rename" },
      ["R"] = { api.tree.reload, "Refresh" },
      ["s"] = { api.node.run.system, "Run System" },
      ["S"] = { api.tree.search_node, "Search" },
      ["U"] = { api.tree.toggle_custom_filter, "Toggle Hidden" },
      ["W"] = { api.tree.collapse_all, "Collapse" },
      ["x"] = { api.fs.cut, "Cut" },
      ["y"] = { api.fs.copy.filename, "Copy Name" },
      ["Y"] = { api.fs.copy.relative_path, "Copy Relative Path" },
      ["<2-LeftMouse>"] = { api.node.open.edit, "Open" },
      ["<2-RightMouse>"] = { api.tree.change_root_to_node, "CD" },
    }
    for keys, mapping in pairs(mappings) do
      vim.keymap.set("n", keys, mapping[1], opts(mapping[2]))
    end
    -- END_DEFAULT_ON_ATTACH
    vim.keymap.set("n", "<CR>", api.node.open.tab_drop, opts "Tab drop")
    vim.keymap.set("n", "l", edit_or_open, opts "Edit Or Open")
    vim.keymap.set("n", "L", vsplit_preview, opts "Open: Vertical Split")

    vim.keymap.set("n", "h", api.node.navigate.parent_close, opts "Close")
    vim.keymap.set("n", "H", api.tree.collapse_all, opts "Collapse All")
    vim.keymap.set("n", "C", api.tree.change_root_to_node, opts "CD")
  end,
}

return M
