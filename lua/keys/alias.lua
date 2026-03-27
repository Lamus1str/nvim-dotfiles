-- Метод для установки горячих клавиш
local map = vim.api.nvim_set_keymap

-- Метод для установки горячих клавиш normalMode
function nm(key, command)
	map('n', key, command, {noremap = true})
end

-- Установка в режиме insert
function im(key, command)
	map('i', key, command, {noremap = true})
end

-- Установка в режиме visual
function vm(key, command)
	map('v', key, command, {noremap = true})
end

-- Установка в режиме terminal
function tm(key, command)
	map('t', key, command, {noremap = true})
end

