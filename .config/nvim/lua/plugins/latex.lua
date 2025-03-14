return {
  {
    "lervag/vimtex",
    lazy = false, -- we don't want to lazy load VimTeX
    -- tag = "v2.15", -- uncomment to pin to a specific release
    init = function()
      -- VimTeX configuration goes here, e.g.
      vim.g.vimtex_view_method =
        "zathura"
      vim.g.tex_flavor =
        "latex"
      vim.g.vimtex_quickfix_mode =
        0
      vim.opt.conceallevel =
        1
      vim.g.tex_conceal =
        "abdmg"
    end,
  },
  {
    "L3MON4D3/LuaSnip",
    -- follow latest release.
    version = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
    -- install jsregexp (optional!).
    build = "make install_jsregexp",
  },
  {
    "iurimateus/luasnip-latex-snippets.nvim",
    -- vimtex isn't required if using treesitter
    dependencies = {
      "L3MON4D3/LuaSnip",
      "lervag/vimtex",
    },
  },
}
