local utils = require "user.utils"
local astro_utils = require "astronvim.utils"
local mappings = {
  n = {
    -- disable default bindings
    ["<C-q>"] = false,
    ["<C-s>"] = false,
    ["q:"] = ":",
    -- better buffer navigation
    ["]b"] = false,
    ["[b"] = false,
    ["<S-l>"] = {
      function() require("astronvim.utils.buffer").nav(vim.v.count > 0 and vim.v.count or 1) end,
      desc = "Next buffer",
    },
    ["<S-h>"] = {
      function() require("astronvim.utils.buffer").nav(-(vim.v.count > 0 and vim.v.count or 1)) end,
      desc = "Previous buffer",

    },
    -- better search
    n = { utils.better_search "n", desc = "Next search" },
    N = { utils.better_search "N", desc = "Previous search" },
    -- better increment/decrement
    ["-"] = { "<c-x>", desc = "Descrement number" },
    ["+"] = { "<c-a>", desc = "Increment number" },
    -- resize with arrows
    ["<C-Up>"] = { function() require("smart-splits").resize_up(2) end, desc = "Resize split up" },
    ["<C-Down>"] = { function() require("smart-splits").resize_down(2) end, desc = "Resize split down" },
    ["<C-Left>"] = { function() require("smart-splits").resize_left(2) end, desc = "Resize split left" },
    ["<C-Right>"] = { function() require("smart-splits").resize_right(2) end, desc = "Resize split right" },
    -- Easy-Align
    ga = { "<Plug>(EasyAlign)", desc = "Easy Align" },
    -- buffer switching
    ["<Tab>"] = {
      function()
        if #vim.t.bufs > 1 then
          require("telescope.builtin").buffers { sort_mru = true, ignore_current_buffer = true }
        else
          astro_utils.notify "No other buffers open"
        end
      end,
      desc = "Switch Buffers",

    },
    --vimwiki
    ["<leader>w"] = { desc = "󰏫  Vimwiki" },
    ["<leader>ww"] = { desc = "Vimwiki Index" },
    -- vim-sandwich
    ["s"] = "<Nop>",
    ["<C-n>"] = { "<cmd>enew<cr>", desc = "New File" },
    ["<C-t>"] = { "<cmd>tabnew<cr>", desc = "New Tab" },
    ["<C-x>"] = { function() require("astronvim.utils.buffer").close() end, desc = "Close buffer" },
    ["<leader><cr>"] = { '<esc>/<++><cr>"_c4l', desc = "Next Template" },
    ["<leader>."] = { "<cmd>cd %:p:h<cr>", desc = "Set CWD" },
    -- neogen
    ["<leader>a"] = { desc = "󰏫 Annotate" },
    ["<leader>a<cr>"] = { function() require("neogen").generate() end, desc = "Current" },
    ["<leader>ac"] = { function() require("neogen").generate { type = "class" } end, desc = "Class" },
    ["<leader>af"] = { function() require("neogen").generate { type = "func" } end, desc = "Function" },
    ["<leader>at"] = { function() require("neogen").generate { type = "type" } end, desc = "Type" },
    ["<leader>aF"] = { function() require("neogen").generate { type = "file" } end, desc = "File" },
    -- Neotree
    ["<A-1>"] = { "<cmd>Neotree toggle<cr>", desc = "Toggle Explorer" },
    ["<leader>e"] = { "<cmd>Neotree focus<cr>", desc = "Focus Explorer" },
    -- Symbols (Aerial)
    ["<leader>o"] = { function() require("aerial").toggle() end, desc = "Symbols outline" },
    -- Telescope
    ["<C>"] = { desc = "󱁤 Telescope" },
    ["<C-S-b>"] = { function() require("telescope.builtin").buffers() end, desc = "Search buffers" },
    ["<C-S-f>"] = {
      function()
        require("telescope.builtin").live_grep {
          additional_args = function(args)
            return vim.list_extend(args,
              { "--hidden", "--no-ignore" })
          end,
        }
      end,
      desc = "Search words in all files",
    },
    ["<C-f>"] = { function() require("telescope.builtin").find_files() end, desc = "Search files" },
    ["<C-S-k>"] = { function() require("telescope.builtin").keymaps() end, desc = "Search keymaps" },
    ["<C-S-c>"] = { function() require("telescope.builtin").commands() end, desc = "Search commands" },
    ["<C-S-m>"] = { function() require("telescope.builtin").marks() end, desc = "Search marks" },
    ["<C-S-d>"] = { function() require("telescope.builtin").diagnostics() end, desc = "Search diagnostics" },
    -- trouble
    ["<leader>x"] = { desc = "裂Trouble" },
    ["gR"] = { "<cmd>Trouble lsp_references<cr>", desc = "Find References" },
    ["gD"] = { "<cmd>Trouble lsp_definitions<cr>", desc = "Find definitions" },
    ["gI"] = { "<cmd>Trouble lsp_implementations<cr>", desc = "Find implementations" },
    ["gT"] = { "<cmd>Trouble lsp_type_definitions<cr>", desc = "Find type definitions" },
  },
  v = {
    ["<leader>r"] = { "<Plug>Send", desc = "Send to REPL" },
  },
  i = {
    -- type template string
    ["<C-CR>"] = { "<++>", desc = "Insert template string" },
    ["<S-Tab>"] = { "<C-V><Tab>", desc = "Tab character" },
    -- date/time input
    ["<c-t>"] = { desc = "󰃰 Date/Time" },
    ["<c-t>n"] = { "<c-r>=strftime('%Y-%m-%d')<cr>", desc = "Y-m-d" },
    ["<c-t>x"] = { "<c-r>=strftime('%m/%d/%y')<cr>", desc = "m/d/y" },
    ["<c-t>f"] = { "<c-r>=strftime('%B %d, %Y')<cr>", desc = "B d, Y" },
    ["<c-t>X"] = { "<c-r>=strftime('%H:%M')<cr>", desc = "H:M" },
    ["<c-t>F"] = { "<c-r>=strftime('%H:%M:%S')<cr>", desc = "H:M:S" },
    ["<c-t>d"] = { "<c-r>=strftime('%Y/%m/%d %H:%M:%S -')<cr>", desc = "Y/m/d H:M:S -" },
  },
  -- terminal mappings
  t = {
    ["<C-BS>"] = { "<C-\\><C-n>", desc = "Terminal normal mode" },
    ["<esc><esc>"] = { "<C-\\><C-n>:q<cr>", desc = "Terminal quit" },
  },
  x = {
    -- better increment/decrement
    ["+"] = { "g<C-a>", desc = "Increment number" },
    ["-"] = { "g<C-x>", desc = "Descrement number" },
    -- line text-objects
    ["il"] = { "g_o^", desc = "Inside line text object" },
    ["al"] = { "$o^", desc = "Around line text object" },
    -- Easy-Align
    ga = { "<Plug>(EasyAlign)", desc = "Easy Align" },
    -- vim-sandwich
    ["s"] = "<Nop>",
  },
  o = {
    -- line text-objects
    ["il"] = { ":normal vil<cr>", desc = "Inside line text object" },
    ["al"] = { ":normal val<cr>", desc = "Around line text object" },
  },
}

-- add more text objects for "in" and "around"
for _, char in ipairs { "_", ".", ":", ",", ";", "|", "/", "\\", "*", "+", "%", "`", "?" } do
  for _, mode in ipairs { "x", "o" } do
    mappings[mode]["i" .. char] =
    { string.format(":<C-u>silent! normal! f%sF%slvt%s<CR>", char, char, char), desc = "between " .. char }
    mappings[mode]["a" .. char] =

    { string.format(":<C-u>silent! normal! f%sF%svf%s<CR>", char, char, char), desc = "around " .. char }
  end
end

return mappings
