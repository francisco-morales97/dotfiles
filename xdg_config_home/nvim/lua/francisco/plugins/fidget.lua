return {
    'j-hui/fidget.nvim',
    config = function()
        local fidget = require('fidget')
        local border = require('utils').border

        fidget.setup({
            notification = {
                override_vim_notify = true,
                window = {
                    border = border,
                    winblend = 0
                }
            }
        })
    end
}
