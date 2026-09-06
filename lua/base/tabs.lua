local opt = vim.opt
local g = vim.g
local api = vim.api

-- Настройки табов
-- Установка количества пробельных символов, при сдвиге "<"
opt.shiftwidth = 2

-- 1 таб = 2 пробела
-- При нажатии <CR> будут вставлять табы
opt.tabstop = 2

-- подстраивать новые строки под предыдущий отступ
opt.smartindent = true

-- Настройки для PHP файлов
api.nvim_create_autocmd("FileType", {
    pattern = "php",
    callback = function()
        vim.opt_local.shiftwidth = 4
				vim.opt_local.tabstop = 4
        vim.opt_local.softtabstop = 4
        vim.opt_local.expandtab = true  -- Преобразовывать табы в пробелы
    end
})
