local opt = vim.opt
local g = vim.g

opt.number = true
opt.relativenumber = true
-- Нумерация строк + относительная нумерация

opt.splitright = true

opt.splitbelow = true
-- Настройка разделения окна редактора на несколько файла
-- Где появляются новые файлы
-- :vsplit
-- :split

opt.clipboard = 'unnamedplus'
-- Системный буфер

opt.fixeol = false
-- дополнение файлов в конце

opt.completeopt = 'menuone,noselect'
-- Встроенный автокомплит

vim.cmd [[autocmd BufEnter * set fo-=c fo-=r fo-=o]]
-- Не автокомментировать новые линии при переходе на новую строку
-- Выполнение комманд vimScript из lua
