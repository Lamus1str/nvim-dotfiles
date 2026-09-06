require('keys/alias')

im('jk', '<escape>')
nm('H', '^')
nm('L', '$')
vm('H', '^')
vm('L', '$')

vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Show diagnostic' })
-- Установка клавиши для просмотра диагностик
