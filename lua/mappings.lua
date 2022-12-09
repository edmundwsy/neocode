local keymaps = require("nvim.keymaps")

local mappings = {}

local function windows()
    keymaps.register("n", {
        ["<C-w>x"] = [[<C-w>s]],
    })
end

local function zen()
    keymaps.register("n", {
        ["<C-Z>"] = [[<cmd>ZenMode<cr>]],
    })
end

local function functions()
    keymaps.register("n", {
        ["<C-a>"] = [[<cmd>TodoTrouble<cr>]],
        ["<C-e>"] = [[<cmd>NvimTreeFocus<cr>]],
        ["<C-f>b"] = [[<cmd>lua require'telescope.builtin'.buffers()<cr>]],
        ["<C-f>p"] = [[<cmd>lua require'telescope'.extensions.project.project()<cr>]],
        ["<C-f>q"] = [[<cmd>lua require('telescope').extensions.frecency.frecency()<cr>]],
        ["<C-f>d"] = [[Telescope diagnostics]],
        ["<C-f>f"] = [[<cmd>lua require'navigation.search'.git_or_local()<cr>]],
        ["<C-f>g"] = [[<cmd>lua require'telescope.builtin'.live_grep()<cr>]],
        ["<C-f>h"] = [[<cmd>lua require'telescope.builtin'.oldfiles()<cr>]],
        ["<C-f>l"] = [[<cmd>lua require'telescope.builtin'.lsp_document_symbols()<cr>]],
        ["<C-f>s"] = [[<cmd>lua require'telescope.builtin'.lsp_workspace_symbols()<cr>]],
        ["<C-q>"] = [[<cmd>Trouble quickfix<cr>]],
        ["<C-x>"] = [[<cmd>Trouble workspace_diagnostics<cr>]],
    })
end

mappings.functions_terminal = "<C-t>"

local function buffer()
    keymaps.register("n", {
        ["<C-b><C-n>"] = [[<cmd>enew<cr>]],
        ["<C-b><C-s>"] = [[<cmd>w<cr>]],
        ["<C-c>"] = [[<cmd>lua require'close_buffers'.delete({ type = 'this' })<cr>]],
        -- ["<C-n>"] = [[<cmd>BufferLineCycleNext<cr>]],
        -- ["<C-p>"] = [[<cmd>BufferLineCyclePrev<cr>]],

        ["K"] = [[<cmd>BufferLineCycleNext<cr>]],
        ["J"] = [[<cmd>BufferLineCyclePrev<cr>]],

        ["<leader>b"] = [[<cmd>BufferLinePick<cr>]],

        ["+"] = [[<C-a>]],
        ["-"] = [[<C-x>]],
    })
    keymaps.register("x", {
        ["+"] = [[g<C-a>]],
        ["-"] = [[g<C-x>]],
    })
end

-- editor
mappings.editor_on_text = {
    ["ga"] = [[<cmd>lua vim.lsp.buf.format()<cr>]],
    ["gd"] = [[<cmd>lua require'telescope.builtin'.lsp_definitions()<cr>]],
    ["gf"] = [[<cmd>lua vim.lsp.buf.declaration()<cr>]],
    ["gH"] = [[<cmd>lua require'telescope.builtin'.lsp_references()<cr>]],
    ["gi"] = [[<cmd>lua vim.lsp.buf.implementation()<cr>]],
    ["gk"] = [[<cmd>lua vim.lsp.buf.hover()<cr>]],
    ["gh"] = [[<cmd>lua vim.lsp.buf.signature_help()<cr>]],
    ["gr"] = [[<cmd>lua vim.lsp.buf.rename()<cr>]],
    ["gx"] = [[<cmd>lua vim.lsp.buf.code_action()<cr>]],
    ["gp"] = [[<cmd>Lspsaga diagnostic_jump_prev<cr>]],
    ["gn"] = [[<cmd>Lspsaga diagnostic_jump_next<cr>]],
}

local function editor_motion()
    keymaps.register("n", {
        ["<leader>l"] = [[<cmd>HopChar1<cr>]],
        ["<leader>k"] = [[<cmd>HopLine<cr>]],
        ["<leader>j"] = [[<cmd>HopLine<cr>]],
        ["<leader>w"] = [[<cmd>HopWord<cr>]],
    })
end

-- local function editor_visual()
-- 
--     keymaps.register("v", {
--         ["J"] = [[:m'>+1<CR>gv=gv]],
--         ["K"] = [[:m-2<CR>gv=gv]],
--     })
-- end

mappings.editor_motion_textsubjects = {
    init_selection = "<CR>",
    scope_incremental = "<CR>",
    node_incremental = "<TAB>",
    node_decremental = "<S-TAB>",
}

mappings.explorer = {
    ["l"] = "edit",
    ["h"] = "close_node",
    ["r"] = "full_rename",
    ["m"] = "cut",
    ["d"] = "remove",
    ["y"] = "copy",
}

mappings.explorer_nocallback = {
    ["<C-c>"] = [[<cmd>NvimTreeClose<cr>]],
    ["<C-e>"] = [[<cmd>NvimTreeClose<cr>]],
    ["q"] = [[<cmd>NvimTreeClose<cr>]],
}

mappings.diagnostics = {
    ["close"] = "<C-c>",
    ["cancel"] = "<C-k>",
    ["refresh"] = "r",
    ["jump"] = "<cr>",
    ["hover"] = "K",
    ["toggle_fold"] = "<space>",
    ["previous"] = "<C-p>",
    ["next"] = "<C-n>",
}

mappings.search = function(actions)
    return {
        ["<C-q>"] = actions.send_to_qflist,
    }
end

local function terminal()
    keymaps.register("t", {
        ["<C-k>"] = [[<C-\><C-n><C-w><C-k>]],
        ["<C-j>"] = [[<cmd>ToggleTerm<cr>]],
    })
end

mappings.setup = function()
    windows()
    zen()
    functions()
    buffer()
    editor_motion()
    -- editor_visual()
    terminal()
end

return mappings
