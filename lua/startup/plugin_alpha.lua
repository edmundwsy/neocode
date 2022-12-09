local alpha = require("alpha")
local dashboard = require("alpha.themes.dashboard")

dashboard.section.buttons.val = {
   dashboard.button("comma s c", " Scheme change", "<cmd>Telescope colorscheme<cr>"),
   dashboard.button("comma f r", " File frecency", "<cmd>Telescope frecency<cr>"),
   dashboard.button("comma f e", " File history", "<cmd>Telescope oldfiles<cr>"),
   dashboard.button("comma f p", " Project find", "<cmd>Telescope project<cr>"),
   dashboard.button("comma f f", " File find", "<cmd>Telescope find_files<cr>"),
   dashboard.button("comma f n", " File new", "<cmd>enew<cr>"),
   dashboard.button("comma f w", " Word find", "<cmd>Telescope live_grep<cr>"),
}
dashboard.section.buttons.opts.hl = "String"

alpha.setup(dashboard.opts)
