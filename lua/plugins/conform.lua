return {
	"stevearc/conform.nvim",
	event = { "BufReadPre", "BufNewFile" },
	cmd = { "ConformInfo" },
	keys = {
		{
			"<leader>f",
			function()
				require("conform").format({ async = true, lsp_fallback = true })
			end,
			mode = "n",
			desc = "Format buffer",
		},
		{
			"<leader>F",
			function()
				require("conform").format({
					async = true,
					lsp_fallback = true,
					range = { 0, vim.fn.line("$") },
				})
			end,
			mode = "v",
			desc = "Format selection",
		},
	},
	opts = {
		formatters_by_ft = {
			php = { "phpcbf" },
			lua = { "stylua" },
			python = { "isort", "black" },
			javascript = { { "prettier", "prettierd" } },
			typescript = { "prettier" },
			-- Добавьте кастомные команды
			["*"] = { "codespell" }, -- Форматтер по умолчанию для всех файлов
		},

		formatters = {
			phpcbf = {
				command = "phpcbf",
				-- Стандартные аргументы для phpcbf
				args = {
					"-d",
					"--standard=PSR12", -- Можно изменить на свой стандарт: PSR1, PSR2, PSR12, или свой phpcs.xml
					"--severity=1",
					"--report=summary",
					"-",           -- Читать из stdin
				},
				stdin = true,    -- Передаем содержимое файла через stdin
				-- Опционально: можно добавить динамические аргументы
				-- cwd = function() return vim.fn.getcwd() end,
			},
			-- Кастомные настройки форматеров
			black = {
				command = "black",
				args = { "--quiet", "-" },
				stdin = true,
			},
			isort = {
				command = "isort",
				args = { "--profile", "black", "-" },
				stdin = true,
			},
			prettier = {
				command = "prettier",
				args = { "--stdin-filepath", "$FILENAME" },
				stdin = true,
			},
		},

		format_on_save = function(bufnr)
			-- Отключаем автоформатирование для определенных файлов
			local ignore_filetypes = { "markdown", "txt" }
			local ft = vim.bo[bufnr].filetype
			-- Без автоформатирования
			if vim.tbl_contains(ignore_filetypes, ft) or true then
				return false
			end
			return {
				timeout_ms = 500,
				lsp_fallback = true,
			}
		end,

		log_level = vim.log.levels.WARN,
		notify_on_error = true,
	},
	config = function(_, opts)
		require("conform").setup(opts)
	end,
}
