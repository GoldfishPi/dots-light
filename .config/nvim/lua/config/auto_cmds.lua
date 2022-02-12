require 'nvim_utils'

local autocmds = {
    Xmonad = {
        {
            "BufWritePost", "~/.xmonad**",
            "!xmonad --recompile && xmonad --restart"
        }
    },
    TickrReact = {
        {
            "BufWinEnter", "/htdocs/tickr-react/**/*",
            "set shiftwidth=2 & set tabstop=2 & set softtabstop=2"
        }
    },
    Format = {
        {
            "BufWritePost", "*.ts,*.tsx,*.lua,*.js",
            "lua vim.lsp.buf.formatting_sync(nil, 1000)"
        }
    },
    AutoSaveFolds = {
        {
            "BufWinLeave,BufLeave,BufWritePost,BufHidden,QuitPre",
            "?*", "nested silent! mkview!"
        }, {"BufWinEnter", "?*?", "silent! loadview"}
    },
    NvimLint = {
        {
            "BufWritePost", "*",
            {"lua require('lint').try_lint()"}
        }
    }
}

nvim_create_augroups(autocmds)
