return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  event = "BufReadPre", -- или без event
  config = function()
    require("nvim-treesitter.config").setup({
			install_dir = vim.fn.stdpath('data')..'/site',
      ensure_installed = { "lua", "vim", "vimdoc", "query", "c", "python", "javascript" },
      auto_install = true,
      highlight = { 
				enable = true,
				additional_vim_regex_highlighting = false,
			},
      indent = { enable = true },
    })
  end,
}
