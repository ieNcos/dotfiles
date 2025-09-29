local M = {
    {
        'windwp/nvim-autopairs',
        enabled = true,
        config = function()
            local Rule = require('nvim-autopairs.rule')
            local npairs = require('nvim-autopairs')
            local cond = require('nvim-autopairs.conds')
            npairs.setup {
                enable_check_bracket_line = false,
                enable_moveright = false,
            }
            npairs.remove_rule '`'

-- {{{ (|) + <space> --> ( | )
--#########################
--## (|)  + space --> ( | )
--#########################
local brackets = { { '(', ')' }, { '[', ']' }, { '{', '}' }, { '$', '$' } }
npairs.add_rules {
  -- Rule for a pair with left-side ' ' and right side ' '
  Rule(' ', ' ')
    -- Pair will only occur if the conditional function returns true
    :with_pair(function(opts)
      -- We are checking if we are inserting a space in (), [], or {}
      local pair = opts.line:sub(opts.col - 1, opts.col)
      return vim.tbl_contains({
        brackets[1][1] .. brackets[1][2],
        brackets[2][1] .. brackets[2][2],
        brackets[3][1] .. brackets[3][2],
        brackets[4][1] .. brackets[4][2],
      }, pair)
    end)
    :with_move(cond.none())
    :with_cr(cond.none())
    -- We only want to delete the pair of spaces when the cursor is as such: ( | )
    :with_del(function(opts)
      local col = vim.api.nvim_win_get_cursor(0)[2]
      local context = opts.line:sub(col - 1, col + 2)
      return vim.tbl_contains({
        brackets[1][1] .. '  ' .. brackets[1][2],
        brackets[2][1] .. '  ' .. brackets[2][2],
        brackets[3][1] .. '  ' .. brackets[3][2]
      }, context)
    end)
}
-- For each pair of brackets we will add another rule
for _, bracket in pairs(brackets) do
  npairs.add_rules {
    -- Each of these rules is for a pair with left-side '( ' and right-side ' )' for each bracket type
    Rule(bracket[1] .. ' ', ' ' .. bracket[2])
      :with_pair(cond.none())
      :with_move(function(opts) return opts.char == bracket[2] end)
      :with_del(cond.none())
      :use_key(bracket[2])
      -- Removes the trailing whitespace that can occur without this
      :replace_map_cr(function(_) return '<C-c>2xi<CR><C-c>O' end)
  }
end
--###############################
--## end of (|) + space --> ( | )
--###############################
        end,
-- }}}
    },



    {'hrsh7th/cmp-buffer'},
	{'hrsh7th/cmp-path'},
	{'hrsh7th/cmp-cmdline'},
	{'hrsh7th/nvim-cmp'},
	{'L3MON4D3/LuaSnip'},
	{'saadparwaiz1/cmp_luasnip'},
	{
        'hrsh7th/nvim-cmp',
        enabled = true,
        --event = 'InsertEnter',
        dependencies = {
            'neovim/nvim-lspconfig',
            'hrsh7th/cmp-nvim-lsp',
            'hrsh7th/cmp-emoji',
        },
		config = function()
			local cmp = require('cmp')
			cmp.setup({
				snippet = {
					expand = function(args)
						-- 以下插件作为前提：
						-- { 'L3MON4D3/LuaSnip' },
						-- { 'saadparwaiz1/cmp_luasnip' },
						require('luasnip').lsp_expand(args.body)
					end,
				},
				--sources = cmp.config.sources(
				--	{
    			--	{ name = 'nvim_lsp' },
    			--	-- 以下插件作为前提：
    			--	-- { 'L3MON4D3/LuaSnip' },
    			--	-- { 'saadparwaiz1/cmp_luasnip' },
    			--	{ name = 'luasnip' },
				--	},
    			--	{
    			--		{ name = 'buffer' },
				--		{ name = 'path' }
    			--	},
                --    { name = 'emoji' }
				--),
				sources = {
    				{ name = 'nvim_lsp' },
    				-- 以下插件作为前提：
    				-- { 'L3MON4D3/LuaSnip' },
    				-- { 'saadparwaiz1/cmp_luasnip' },
    				{ name = 'luasnip' },
    				{ name = 'buffer' },
					{ name = 'path' },
                    { name = 'emoji' }
				},
				mapping = {
    				-- 上一个
    				['<C-p>'] = cmp.mapping.select_prev_item(),
    				-- 下一个
    				['<C-n>'] = cmp.mapping.select_next_item(),
    				-- 出现补全
    				-- ['<A-.>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
    				-- 取消
    				-- ['<A-,>'] = cmp.mapping({
					-- i = cmp.mapping.abort(),
					-- c = cmp.mapping.close(),
    				-- }),
    				-- 确认
    				-- Accept currently selected item. If none selected, `select` first item.
    				-- Set `select` to `false` to only confirm explicitly selected items.
    				['<C-f>'] = cmp.mapping.confirm({
					select = true,
    				behavior = cmp.ConfirmBehavior.Replace
    				}),
    				-- ['<C-y>'] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
    				-- ['<C-u>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
    				-- ['<C-d>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
				}
			})
		end
	},

    {
        "nvim-tree/nvim-web-devicons",
        enabled = true
    }
}
return M
