return {
	"L3MON4D3/LuaSnip",
	-- follow latest release.
	version = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
	-- install jsregexp (optional!).
	build = "make install_jsregexp",
    enabled = true,
  config = function()
		require('luasnip').config.setup({
      -- Enable autotriggered snippets
      enable_autosnippets = true,
      -- Use Tab (or some other key if you prefer) to trigger visual selection
      store_selection_keys = "<Tab>",
	  update_events = 'TextChanged,TextChangedI',
	  })
      local ls = require("luasnip")

        vim.keymap.set({"i"}, "<C-f>", function() ls.expand() end, {silent = true})
        vim.keymap.set({"i", "s"}, "<C-i>", function() ls.jump( 1) end, {silent = true})
        vim.keymap.set({"i", "s"}, "<C-o>", function() ls.jump(-1) end, {silent = true})
        vim.keymap.set({"i", "s"}, "<tab>", "<tab>", { silent = true })


        vim.keymap.set({"i", "s"}, "<C-c>", function()
        	if ls.choice_active() then
        		ls.change_choice(1)
        	end
        end, {silent = true})
--       vim.cmd[[
-- " Expand snippets in insert mode with Tab
-- imap <silent><expr> <c-f> luasnip#expandable() ? '<Plug>luasnip-expand-snippet' : '<c-f>'
--
-- " Jump forward in through tabstops in insert and visual mode with Control-f
-- imap <silent><expr> <Tab> luasnip#jumpable(1) ? '<Plug>luasnip-jump-next' : '<Tab>'
-- smap <silent><expr> <Tab> luasnip#jumpable(1) ? '<Plug>luasnip-jump-next' : '<Tab>'
--
-- " Jump backward through snippet tabstops with Shift-Tab (for example)
-- imap <silent><expr> <S-Tab> luasnip#jumpable(-1) ? '<Plug>luasnip-jump-prev' : '<Left>'
-- smap <silent><expr> <S-Tab> luasnip#jumpable(-1) ? '<Plug>luasnip-jump-prev' : '<Left>'
--
-- " Cycle forward through choice nodes with Control-f (for example)
-- imap <silent><expr> <C-n> luasnip#choice_active() ? '<Plug>luasnip-next-choice' : '<C-n>'
-- smap <silent><expr> <C-n> luasnip#choice_active() ? '<Plug>luasnip-next-choice' : '<C-n>'
-- ]]

	end,
	--config = function()
		--require("Luasnip").setup({
    ---- Enable autotriggered snippets
    --enable_autosnippets = true,
    ---- Use Tab (or some other key if you prefer) to trigger visual selection
    --store_selection_keys = "<Tab>",
		--})
	--end

}



--hi
--vim.keymap.set({"i"}, "<C-n>", function() ls.expand() end, {silent = true}),
--vim.keymap.set({"i", "s"}, "<C-i>", function() ls.jump( 1) end, {silent = true}),
--vim.keymap.set({"i", "s"}, "<S-Tab>", function() ls.jump(-1) end, {silent = true}),
--
--vim.keymap.set({"i", "s"}, "<C-E>", function()
--	if ls.choice_active() then
--		ls.change_choice(1)
--	end
--end, {silent = true})

