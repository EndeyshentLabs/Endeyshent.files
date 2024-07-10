-- Mini.nvim
local path_package = vim.fn.stdpath("data") .. "/site"
local mini_path = path_package .. "/pack/deps/start/mini.nvim"
if not vim.loop.fs_stat(mini_path) then
    vim.cmd("echo 'Installing `mini.nvim`' | redraw")
    local clone_cmd = {
        "git", "clone", "--filter=blob:none",
        -- Uncomment next line to use "stable" branch
        -- "--branch", "stable",
        "https://github.com/echasnovski/mini.nvim", mini_path
    }
    vim.fn.system(clone_cmd)
    vim.cmd("packadd mini.nvim | helptags ALL")
end

vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.cursorline = true
vim.opt.signcolumn = "yes"
vim.opt.mouse = "a"
vim.opt.expandtab = true
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.scrolloff = 10
vim.opt.clipboard = "unnamedplus"
vim.opt.termguicolors = true

require("mini.deps").setup()

local now = MiniDeps.now
local later = MiniDeps.later
local add = MiniDeps.add

now(function()
    add("RRethy/base16-nvim")
    vim.cmd.colorscheme("base16-pop")
end)

now(function()
    local filterout_lua_diagnosing = function(notif_arr)
        local not_diagnosing = function(notif) return not vim.startswith(notif.msg, "lua_ls: Diagnosing") end
        notif_arr = vim.tbl_filter(not_diagnosing, notif_arr)
        return MiniNotify.default_sort(notif_arr)
    end
    require("mini.notify").setup({
        content = { sort = filterout_lua_diagnosing },
        window = { config = { border = "double" } },
    })
    vim.notify = MiniNotify.make_notify()
end)

now(function() require("mini.starter").setup() end)

now(function() require("mini.statusline").setup() end)

now(function() require("mini.tabline").setup() end)

now(function() require("mini.visits").setup() end)

now(function() require("mini.trailspace").setup() end)

now(function() require("mini.indentscope").setup() end)

now(function() require("mini.git").setup() end)

now(function()
    require("mini.bufremove").setup()
    vim.keymap.set("n", "<Leader>Bd", MiniBufremove.delete, { desc = "Delete buffer" })
    vim.keymap.set("n", "<Leader>Bu", MiniBufremove.unshow, { desc = "Unshow buffer" })
end)

now(function()
    require("mini.icons").setup()
    MiniIcons.mock_nvim_web_devicons()
end)

later(function() require("mini.extra").setup() end)

later(function()
    local ai = require("mini.ai")
    ai.setup({
        custom_textobjects = {
            B = MiniExtra.gen_ai_spec.buffer(),
        },
    })
end)

later(function()
    require("mini.basics").setup({
        options = {
            basic = true,
            extra_ui = true,
        },
        mappings = {
            basic = true,
            option_toggle_prefix = [[ ]],
            windows = true,
            move_with_alt = true,
        },
    })
end)

later(function()
    local miniclue = require("mini.clue")
    miniclue.setup({
        triggers = {
            -- Leader triggers
            { mode = "n", keys = "<Leader>" },
            { mode = "x", keys = "<Leader>" },

            -- Built-in completion
            { mode = "i", keys = "<C-x>" },

            -- `g` key
            { mode = "n", keys = "g" },
            { mode = "x", keys = "g" },

            -- Marks
            { mode = "n", keys = "\"" },
            { mode = "n", keys = "`" },
            { mode = "x", keys = "\"" },
            { mode = "x", keys = "`" },

            -- Registers
            { mode = "n", keys = "\"" },
            { mode = "x", keys = "\"" },
            { mode = "i", keys = "<C-r>" },
            { mode = "c", keys = "<C-r>" },

            -- Window commands
            { mode = "n", keys = "<C-w>" },

            -- `z` key
            { mode = "n", keys = "z" },
            { mode = "x", keys = "z" },
        },
        clues = {
            -- Custom mappings
            { mode = "n", keys = "<Leader>B", desc = "+Buffers" },
            { mode = "n", keys = "<Leader>L", desc = "+LSP" },
            { mode = "n", keys = "<Leader>f", desc = "+Find" },
            miniclue.gen_clues.builtin_completion(),
            miniclue.gen_clues.g(),
            miniclue.gen_clues.marks(),
            miniclue.gen_clues.registers(),
            miniclue.gen_clues.windows(),
            miniclue.gen_clues.z(),
        },

        window = {
            delay = 500,
        },
    })
end)

later(function() require("mini.comment").setup() end)

later(function()
    require("mini.completion").setup({
        lsp_completion = {
            source_func = "omnifunc",
            auto_setup = true,
        },
    })
end)

now(function()
    local keycode = vim.keycode or function(x)
        return vim.api.nvim_replace_termcodes(x, true, true, true)
    end

    local keys = {
        ["cr"]        = keycode("<CR>"),
        ["ctrl-y"]    = keycode("<C-y>"),
        ["ctrl-y_cr"] = keycode("<C-y><CR>"),
    }

    _G.cr_action = function()
        if vim.fn.pumvisible() ~= 0 then
            local item_selected = vim.fn.complete_info()["selected"] ~= -1
            return item_selected and keys["ctrl-y"] or keys["ctrl-y_cr"]
        else
            return keys["cr"]
        end
    end

    vim.keymap.set("i", "<CR>", "v:lua._G.cr_action()", { expr = true })
end)

later(function() require("mini.files").setup() end)

later(function()
    local hipatterns = require("mini.hipatterns")
    local hi_words = MiniExtra.gen_highlighter.words
    hipatterns.setup({
        highlighters = {
            fixme = hi_words({ "FIXME", "Fixme", "fixme" }, "MiniHipatternsFixme"),
            hack = hi_words({ "HACK", "Hack", "hack" }, "MiniHipatternsHack"),
            todo = hi_words({ "TODO", "Todo", "todo" }, "MiniHipatternsTodo"),
            note = hi_words({ "NOTE", "Note", "note" }, "MiniHipatternsNote"),
            hex_color = hipatterns.gen_highlighter.hex_color(),
        },
    })
end)

later(function()
    require("mini.pairs").setup({ modes = { insert = true, command = true, terminal = true } })
end)

later(function() require("mini.splitjoin").setup() end)

later(function() require("mini.surround").setup() end)

require("mini.align").setup()

later(function()
    local ts_spec = {
        source = "nvim-treesitter/nvim-treesitter",
        checkout = "master",
        hooks = { post_checkout = function() vim.cmd("TSUpdate") end },
    }
    add({ source = "nvim-treesitter/nvim-treesitter-textobjects", depends = { ts_spec } })

    require("nvim-treesitter.configs").setup({
        ensure_installed = { "lua" },
        highlight = { enable = true },
        incremental_selection = { enable = true },
        textobjects = { enable = true },
        indent = { enable = true },
    })

    local ts_query = require("vim.treesitter.query")
    local ts_query_set = ts_query.set or ts_query.set_query
    ts_query_set("lua", "injections", "")
end)

later(function()
    add({ source = "williamboman/mason.nvim", depends = { "williamboman/mason-lspconfig.nvim", "neovim/nvim-lspconfig" } })

    require("mason").setup()
    require("mason-lspconfig").setup()

    require("mason-lspconfig").setup_handlers({
        function(server_name)
            require("lspconfig")[server_name].setup {}
        end,
    })

    local on_attach_custom = function(client, buf_id)
        vim.bo[buf_id].omnifunc = "v:lua.MiniCompletion.completefunc_lsp"
        vim.keymap.set("n", "K", vim.lsp.buf.hover, { desc = "Symbol hover" })

        if client.server_capabilities.inlayHintProvider then
            vim.lsp.inlay_hint.enable(true, { bufnr = 0 })
        end

        local builtin = require("telescope.builtin")
        vim.keymap.set("n", "<Leader>La", vim.lsp.buf.code_action, { desc = "Code action" })
        vim.keymap.set("n", "<Leader>Lf", vim.lsp.buf.format, { desc = "Format" })
        vim.keymap.set("n", "<Leader>Lr", vim.lsp.buf.rename, { desc = "Rename" })
        vim.keymap.set("n", "<Leader>LR", vim.lsp.buf.references, { desc = "References" })
        vim.keymap.set("n", "<Leader>LS", builtin.lsp_workspace_symbols, { desc = "Workspace symbols" })
        vim.keymap.set("n", "<Leader>LD", builtin.diagnostics, { desc = "Workspace diagnostics" })
        vim.keymap.set("n", "<Leader>Ld", vim.diagnostic.open_float, { desc = "Line diagnostics" })
    end

    for _, server in ipairs(require("mason-lspconfig").get_installed_servers()) do
        require("lspconfig")[server].setup({ on_attach = on_attach_custom })
    end
end)

later(function()
    add({
        source = "L3MON4D3/LuaSnip",
        depends = { "rafamadriz/friendly-snippets" },
        hooks = { post_checkout = function() vim.cmd("!make install_jsregexp") end },
    })
    require("luasnip.loaders.from_vscode").lazy_load()
    local ls = require("luasnip")

    vim.keymap.set({ "i", "s" }, "<C-l>", function() if ls.expand_or_jumpable() then ls.expand_or_jump() end end,
        { silent = true })
    vim.keymap.set({ "i", "s" }, "<C-h>", function() if ls.jumpable() then ls.jump(-1) end end, { silent = true })
end)

later(function()
    add({
        source = "nvim-telescope/telescope.nvim",
        checkout = "0.1.x",
        depends = { "nvim-lua/plenary.nvim" }
    })

    require("telescope").setup()

    local builtin = require("telescope.builtin")
    vim.keymap.set("n", "<Leader><Leader>", builtin.find_files, { desc = "Find files" })
    vim.keymap.set("n", "<Leader>ff", builtin.git_files, { desc = "Find files" })
    vim.keymap.set("n", "<Leader>fg", builtin.live_grep, { desc = "Live GREP" })
    vim.keymap.set("n", "<Leader>fh", builtin.help_tags, { desc = "Find vimdoc" })
    vim.keymap.set("n", "<Leader>fr", builtin.oldfiles, { desc = "Find recently opened files" })
    vim.keymap.set("n", "<Leader>fM", builtin.man_pages, { desc = "Find man pages" })
    vim.keymap.set("n", "<Leader>fM", function()
        if not MiniFiles.close() then MiniFiles.open() end
    end, { desc = "mini.files" })
    vim.keymap.set("n", "<Leader>fC", builtin.colorscheme, { desc = "Find Colorschemes" })
end)

vim.keymap.set("n", "H", "<Cmd>bp<CR>")
vim.keymap.set("n", "L", "<Cmd>bn<CR>")
