return {
	"neanias/everforest-nvim",
	version = false,
	priority = 1000,
	config = function()
		-- тут пока ничего нет
		vim.o.termguicolors = true

		require("everforest").setup({
			background = "hard",
		})

		vim.cmd.colorscheme("everforest")
	end,
}
