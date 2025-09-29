local in_mathzone = function()
  -- The `in_mathzone` function requires the VimTeX plugin
  return vim.fn['vimtex#syntax#in_mathzone']() == 1
end

return {
-- Examples of Greek letter snippets, autotriggered for efficiency
s({trig=";a", snippetType="autosnippet", wordTrig = false},
  {
    t("\\alpha"),
  },
	{ condition = in_mathzone }
),

s({trig=";b", snippetType="autosnippet", wordTrig = false},
  {
    t("\\beta"),
  },
	{ condition = in_mathzone }
),

s({trig=";g", snippetType="autosnippet", wordTrig = false},
  {
    t("\\gamma"),
  },
	{ condition = in_mathzone }
),

s({trig=";G", snippetType="autosnippet", wordTrig = false},
  {
    t("\\Gamma"),
  },
	{ condition = in_mathzone }
),

s({trig=";d", snippetType="autosnippet", wordTrig = false},
  {
    t("\\delta"),
  },
	{ condition = in_mathzone }
),

s({trig=";D", snippetType="autosnippet", wordTrig = false},
  {
    t("\\Delta"),
  },
	{ condition = in_mathzone }
),

s({trig=";e", snippetType="autosnippet", wordTrig = false},
  {
    t("\\epsilon"),
  },
	{ condition = in_mathzone }
),

s({trig=";ve", snippetType="autosnippet", wordTrig = false},
  {
    t("\\varepsilon"),
  },
	{ condition = in_mathzone }
),

s({trig=";z", snippetType="autosnippet", wordTrig = false},
  {
    t("\\zeta"),
  },
	{ condition = in_mathzone }
),

s({trig=";th", snippetType="autosnippet", wordTrig = false},
  {
    t("\\theta"),
  },
	{ condition = in_mathzone }
),

s({trig=";Th", snippetType="autosnippet", wordTrig = false},
  {
    t("\\Theta"),
  },
	{ condition = in_mathzone }
),

s({trig=";vt", snippetType="autosnippet", wordTrig = false},
  {
    t("\\vartheta"),
  },
	{ condition = in_mathzone }
),

s({trig=";k", snippetType="autosnippet", wordTrig = false},
  {
    t("\\kappa"),
  },
	{ condition = in_mathzone }
),

s({trig=";l", snippetType="autosnippet", wordTrig = false},
  {
    t("\\lambda"),
  },
	{ condition = in_mathzone }
),

s({trig=";L", snippetType="autosnippet", wordTrig = false},
  {
    t("\\Lambda"),
  },
	{ condition = in_mathzone }
),

s({trig=";m", snippetType="autosnippet", wordTrig = false},
  {
    t("\\mu"),
  },
	{ condition = in_mathzone }
),

s({trig=";x", snippetType="autosnippet", wordTrig = false},
  {
    t("\\xi"),
  },
	{ condition = in_mathzone }
),

--s({trig=";X", snippetType="autosnippet", wordTrig = false},
--  {
--    t("\\Xi"),
--  },
--  { condition = in_mathzone }
--),

s({trig="pi", snippetType="autosnippet", wordTrig = false},
  {
    t("\\pi"),
  },
	{ condition = in_mathzone }
),

s({trig="Pi", snippetType="autosnippet", wordTrig = false},
  {
    t("\\Pi"),
  },
	{ condition = in_mathzone }
),

s({trig=";s", snippetType="autosnippet", wordTrig = false},
  {
    t("\\sigma"),
  },
	{ condition = in_mathzone }
),

s({trig=";S", snippetType="autosnippet", wordTrig = false},
  {
    t("\\Sigma"),
  },
	{ condition = in_mathzone }
),

s({trig=";ph", snippetType="autosnippet", wordTrig = false},
  {
    t("\\phi"),
  },
	{ condition = in_mathzone }
),

s({trig="vp", snippetType="autosnippet", wordTrig = false},
  {
    t("\\varphi"),
  },
	{ condition = in_mathzone }
),

s({trig=";Ph", snippetType="autosnippet", wordTrig = false},
  {
    t("\\Phi"),
  },
	{ condition = in_mathzone }
),

s({trig=";ps", snippetType="autosnippet", wordTrig = false},
  {
    t("\\psi"),
  },
	{ condition = in_mathzone }
),

s({trig=";Ps", snippetType="autosnippet", wordTrig = false},
  {
    t("\\Psi"),
  },
	{ condition = in_mathzone }
),

s({trig=";o", snippetType="autosnippet", wordTrig = false},
  {
    t("\\omega"),
  },
	{ condition = in_mathzone }
),

s({trig=";O", snippetType="autosnippet", wordTrig = false},
  {
    t("\\Omega"),
  },
	{ condition = in_mathzone }
),

s({trig=";c", snippetType="autosnippet", wordTrig = false},
  {
    t("\\chi"),
  },
	{ condition = in_mathzone }
),

s({trig=";ta", snippetType="autosnippet", wordTrig = false},
  {
    t("\\tau"),
  },
	{ condition = in_mathzone }
),

s({trig=";et", snippetType="autosnippet", wordTrig = false},
  {
    t("\\eta"),
  },
	{ condition = in_mathzone }
),

s({trig=";rh", snippetType="autosnippet", wordTrig = false},
  {
    t("\\rho"),
  },
	{ condition = in_mathzone }
),

s({trig = ";hb", dscr = "description", snippetType = "autosnippet", wordTrig = false, regTrig = true},
  {
    t("\\hbar"),
  },
	{ condition = in_mathzone }
),

}
