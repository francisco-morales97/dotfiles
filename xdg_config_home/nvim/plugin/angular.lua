vim.filetype.add({
    pattern = {
        [".*%.component%.html"] = "htmlangular",
    }
})

vim.cmd('runtime! ftplugin/html.vim!')

-- vim.api.nvim_create_autocmd("FileType", {
--     pattern = "angular.html",
--     callback = function()
--         vim.treesitter.language.register("angular", "angular.html")
--     end
-- })
