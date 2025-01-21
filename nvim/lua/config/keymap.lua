--keymaps
local wk = require 'which-key'

local in_mathzone = function()
    local result = vim.treesitter.get_captures_at_cursor(0)
    local flag = false
    for _, v in ipairs(result) do
        if v == "markup.math" then
            --return true
            vim.notify("yes")
            return true
        end
    end
    vim.notify("no")
    return false
end

vim.keymap.set("n",    "<C-e>",
    function ()
        vim.notify(vim.inspect(vim.treesitter.get_captures_at_cursor(0)))
    end,
    { noremap = true, silent = false }
)

vim.keymap.set("n", "<c-m>",
    function ()
        local current_row = vim.api.nvim_win_get_cursor(0)[1]
        local current_buffer = vim.api.nvim_get_current_buf()
        local current_line_content = vim.api.nvim_buf_get_lines(
            current_buffer,
            current_row-1,
            current_row,
            false)
        vim.notify(current_line_content[1])
    end, { noremap = true, silent = false }
)


local nmap = function (key, effect)
    vim.keymap.set('n', key, effect, { silent = true, noremap = true })
end

local imap = function (key, effect)
    vim.keymap.set('i', key, effect, { silent = true, noremap = true })
end

local vmap = function (key, effect)
    vim.keymap.set('v', key, effect, { silent = true, noremap = true })
end

local nvmap = function (key, effect)
    vim.keymap.set({'n', 'v'}, key, effect, { silent = true, noremap = true })
end
nmap("d",
    function ()
        local current_row = vim.api.nvim_win_get_cursor(0)[1]
        local current_buffer = vim.api.nvim_get_current_buf()
        local current_line_content = vim.api.nvim_buf_get_lines(
            current_buffer,
            current_row-1,
            -- unfortunately the index begin from 0, so we need to sub 1
            current_row,
            false)[1]
        -- vim.notify(tostring(current_line_content))
        if current_line_content == "" then
            vim.fn.deletebufline(current_buffer, current_row, current_row)
            -- vim.cmd("normal! dd")
            -- the difference is about clipboard
        else
            vim.cmd("normal! x")
        end
    end
)
nmap("<c-,>",
    function ()
        local current_row = vim.api.nvim_win_get_cursor(0)
        -- vim.print(current_row)
        local current_column = vim.api.nvim_win_get_cursor(0)[2]
        vim.print(current_column)
        vim.cmd("normal! yyp")
        vim.cmd("normal! "..tostring(current_column+1).."|")
    end)
-- nmap("<S-CR>", "o<esc>")
imap("<C-;>", "<esc>")
imap("。", ". ")


nmap("<C-f>", "<C-f>")
nmap("<S-right>", "<C-w>>")
nmap("<S-left>", "<C-w><")
nmap("<S-up>", "<C-w>+")
nmap("<S-down>", "<C-w>-")

nmap("<right>", "<C-w>l")
nmap("<left>", "<C-w>h")
nmap("<up>", "<C-w>k")
nmap("<down>", "<C-w>j")
nmap("<C-k>", "<C-w>j")
nmap("<C-l>", "<C-w>k")
imap("<C-k>", "<C-w>j")
imap("<C-l>", "<C-w>k")

nmap("<C-right>", "<Cmd>vsplit<Cr><C-w>l")
nmap("<C-left>", "<Cmd>vsplit<Cr>")
nmap("<C-up>", "<Cmd>split<Cr>")
nmap("<C-down>", "<Cmd>split<Cr><C-w>j")

nmap("<c-j>", "J")
nmap("x", "V")
vmap("x", "j")
nmap("y", "vy")

nmap("zi", "za")
nmap("za", "zi")

nvmap("U", "<c-R>")
nvmap("j", 'h')
nvmap("k", 'gj')
nvmap("l", 'gk')
nvmap(";", 'l')
nvmap("K", '5gj')
nvmap("L", '5gk')

-- nvmap("<leader>na", "I# <esc>")
-- nvmap("<leader>nx", "^xx")

vmap('"', ':')
vmap("<leader>f&", ":!column -t -s '&' -o '&'<cr>")
vmap("<leader>f|", ":!column -t -s '|' -o '|'<cr>")
vmap("Y", "\"+y")

imap("jk", "<right>")
-- imap("<esc>", function ()
--     -- local current_buffer = vim.api.nvim_get_current_buf()
--     local current_column = vim.api.nvim_win_get_cursor(0)[2]
--     vim.notify(tostring(current_column))
--     vim.cmd([[stopinsert]])
--     if current_column ~= 0 then
--         local current_column = vim.api.nvim_win_get_cursor(0)[2]
--         vim.notify("after" .. tostring(current_column))
--         -- vim.cmd([[normal! l]])
--     end
-- end)
-- nmap("<c-m>", function ()
    -- local current_column = vim.api.nvim_win_get_cursor(0)[2]
    -- vim.notify(tostring(current_column))
-- end)


-- nmap('<leader>dd', function ()
--     vim.diagnostic.enable(false)
-- end)
-- nmap('<leader>dD', function ()
--     vim.diagnostic.enable(false)
--     vim.cmd([[:LspStop]])
-- end)



local mode_nv = { "n", "v" }
local mode_v = { "v" }
local mode_i = { "i" }
local mode_t = { "t" }
local nmappings = {
    { from = "W",          to = "<Cmd>wq!<CR>",           mode = mode_t },

    { from = "<esc>",      to = "<c-\\><c-n>",            mode = mode_t },
    { from = "<esc>",      to = ":" },
    -- { from = "<leader>bi", to = "<Cmd>%!xxd<CR>" },
    -- { from = "<leader>bb", to = "<Cmd>%!xxd -r<CR>" },
    -- { from = "tt",         to = "<Cmd>NERDTreeToggle<CR>" },
    --	{ from = "`",             to = "~",                                                                   mode = mode_nv },
    --
    -- Movement
    --{ from = "l",          to = "gk",                     mode = mode_nv },
    --{ from = "k",          to = "gj",                     mode = mode_nv },
    --{ from = "j",          to = "h",                      mode = mode_nv },
    --{ from = ";",          to = "l",                      mode = mode_nv },
    --{ from = "L",          to = "5gk",                     mode = mode_nv },
    --{ from = "K",          to = "5gj",                     mode = mode_nv },
    { from = "H",          to = "K",                      mode = mode_nv },
    { from = "J",          to = "0",                      mode = mode_nv },
    { from = ":",          to = "$",                      mode = mode_nv },
    { from = "gk",         to = "gj",                     mode = mode_nv },
    { from = "gl",         to = "gk",                     mode = mode_nv },
    { from = "<Up>",       to = "<c-o>gk",                mode = mode_i },
    { from = "<Down>",     to = "<c-o>gj",                mode = mode_i },
    { from = "<c-a>",      to = "<ESC>A",                 mode = mode_i },
    { from = "cc",      to = "$zfa{" },
    --
    --	-- Window & splits
    { from = "<leader>w",  to = "<C-w>w", },
    { from = "<leader>l",  to = "<C-w>k", },
    { from = "<leader>k",  to = "<C-w>j", },
    { from = "<leader>j",  to = "<C-w>h", },
    { from = "<leader>;",  to = "<C-w>l", },
    --	{ from = "qf",            to = "<C-w>o", },
    --	{ from = "s",             to = "<nop>", },
    --	{ from = "su",            to = ":set nosplitbelow<CR>:split<CR>:set splitbelow<CR>", },
    --	{ from = "se",            to = ":set splitbelow<CR>:split<CR>", },
    --	{ from = "sn",            to = ":set nosplitright<CR>:vsplit<CR>:set splitright<CR>", },
    --	{ from = "si",            to = ":set splitright<CR>:vsplit<CR>", },
    --	{ from = "<up>",          to = ":res +5<CR>", },
    --	{ from = "<down>",        to = ":res -5<CR>", },
    --	{ from = "<left>",        to = ":vertical resize-5<CR>", },
    --	{ from = "<right>",       to = ":vertical resize+5<CR>", },
    --	-- { from = "sh",            to = "se", },
    --	-- { from = "sh",            to = "<C-w>t<C-w>K", },
    --	-- { from = "sv",            to = "<C-w>t<C-w>H", },
    --	{ from = "srh",           to = "<C-w>b<C-w>K", },
    --	{ from = "srv",           to = "<C-w>b<C-w>H", },
    --
    --	-- Tab management
    --	{ from = "tu",            to = ":tabe<CR>", },
    --	{ from = "tU",            to = ":tab split<CR>", },
    --	{ from = "tn",            to = ":-tabnext<CR>", },
    --	{ from = "ti",            to = ":+tabnext<CR>", },
    --	{ from = "tmn",           to = ":-tabmove<CR>", },
    --	{ from = "tmi",           to = ":+tabmove<CR>", },

    -- Other
    --	{ from = "<leader>sw",    to = ":set wrap<CR>" },
    --	{ from = "<leader>sc",    to = ":set spell!<CR>" },
    --	{ from = "<leader><CR>",  to = ":nohlsearch<CR>" },
    --	{ from = "<f10>",         to = ":TSHighlightCapturesUnderCursor<CR>" },
    --	{ from = "<leader>o",     to = "za" },
    --	{ from = "<leader>pr",    to = ":profile start profile.log<CR>:profile func *<CR>:profile file *<CR>" },
    --	{ from = "<leader>rc",    to = ":e ~/.config/nvim/init.lua<CR>" },
    --	{ from = "<leader>rv",    to = ":e .vim.lua<CR>" },
    --	{ from = ",v",            to = "v%" },
    --	{ from = "<leader><esc>", to = "<nop>" },
    --
    --	-- Joshuto
}


for _, mapping in ipairs(nmappings) do
    vim.keymap.set(mapping.mode or "n", mapping.from, mapping.to, { noremap = true })
end

wk.add({
    {
        { "<leader>r", group = "rrrr" },
        { "<leader>rf", "<cmd>split<cr>", desc = "split" },
        { "<leader>q", group = "[q]uarto" },
        { "<leader>qp", "<Cmd>lua require'quarto'.quartoPreview()<CR>", desc = "[q]arto[p]review" },
    }
})

vim.cmd([[
cnoremap <expr> %% getcmdtype( ) == ':' ? expand('%:h').'/' : '%%'
]])
