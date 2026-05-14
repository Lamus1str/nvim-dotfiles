-- BASE
require('base/search')
require('base/tabs')
require('base/other')

-- KEYS
require('keys/main')

-- LAZY
require('base/lazy')

vim.api.nvim_create_autocmd('FileType', {
  pattern = { '<filetype>' },
  callback = function() vim.treesitter.start() end,
})
