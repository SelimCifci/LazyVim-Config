-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

vim.opt.tabstop = 4 -- Visual spaces per tab
vim.opt.softtabstop = 4 -- Spaces felt when editing
vim.opt.shiftwidth = 4 -- Size of an indent

require("lspconfig").lua_ls.setup({
    settings = {
        Lua = {
            workspace = {
                library = {
                    "${3rd}/love2d/library",
                },
            },
            diagnostics = {
                globals = {
                    "vim",
                    "love",
                },
                disable = {
                    "lowercase-global",
                },
            },
        },
    },
})

-- Autosave
local autosave_group = vim.api.nvim_create_augroup("Autosave", { clear = true })

vim.api.nvim_create_autocmd({ "InsertLeave", "TextChanged", "FocusLost" }, {
    group = autosave_group,
    pattern = "*",
    callback = function()
        -- Only save if the buffer has been modified and is a "normal" file
        if vim.bo.modified and vim.fn.expand("%") ~= "" and vim.bo.buftype == "" then
            vim.cmd("silent! update")
        end
    end,
})
