local cmp = require("cmp")
local handle = require("language.completion")

local M = {}
function M.setup()
    local options = require("nvim.options")
    options.set(options.scope.option, "pumheight", 12)

    cmp.setup({
        completion = {
            completeopt = "menu,menuone,noinsert",
        },
        formatting = {
            format = function(entry, vim_item)
                vim_item.kind = require("lspkind").presets.default[vim_item.kind]

                vim_item.menu = ({
                    luasnip = "[snip]",
                    buffer = "[buffer]",
                    nvim_lsp = "[lsp]",
                    nvim_lua = "[lua]",
                    path = "[path]",
                    copilot = '[]'
                })[entry.source.name]

                return vim_item
            end,
        },
        -- TODO: Refactor mapping into mappings.lua
        mapping = {
            ["<C-p>"] = cmp.mapping.select_prev_item(),
            ["<C-n>"] = cmp.mapping.select_next_item(),
            ["<C-u>"] = cmp.mapping.scroll_docs(-4),
            ["<C-d>"] = cmp.mapping.scroll_docs(4),
            ["<Tab>"] = cmp.mapping.confirm({
                behavior = cmp.ConfirmBehavior.Insert,
                select = false,
            }),
            ["<S-Tab>"] = cmp.mapping(handle.jump_next, { "i", "s" }),
            ["<C-Tab>"] = cmp.mapping(handle.jump_previous, { "i", "s" }),
        },
        snippet = {
            expand = function(args)
                require("luasnip").lsp_expand(args.body)
            end,
        },
        sources = {
            { name = "luasnip" },
            { name = "nvim_lsp" },
            { name = "nvim_lua" },
            { name = "path" },
            { name = "buffer" },
			{ name = "copilot" },
        },
    })
end

return M
